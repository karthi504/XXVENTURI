create or replace package body xxventuri.consent_ledger_pkg as

    -- ============================================
    -- EXISTING FUNCTIONS (keep as-is)
    -- ============================================

    function make_hash (
        p_subject_id in varchar2,
        p_type_id    in varchar2,
        p_action     in varchar2,
        p_prev_hash  in raw,
        p_details    in varchar2,
        p_date       in timestamp
    ) return raw is
        v_string varchar2(4000);
    begin
        v_string := p_subject_id
                    || '|'
                    || p_type_id
                    || '|'
                    || p_action
                    || '|'
                    || nvl(
            rawtohex(p_prev_hash),
            'START'
        )
                    || '|'
                    || p_details
                    || '|'
                    || to_char(p_date, 'YYYY-MM-DD HH24:MI:SS');

        return dbms_crypto.hash(
            utl_raw.cast_to_raw(v_string),
            dbms_crypto.hash_sh256
        );
    end make_hash;

    procedure add_consent (
        p_subject_id  in varchar2,
        p_type_id     in varchar2,
        p_action      in varchar2,
        p_details     in varchar2,
        p_valid_until in date default null
    ) is

        v_ledger_id    varchar2(100);
        v_prev_hash    raw(64);
        v_current_hash raw(64);
        v_now          timestamp := current_timestamp;
    begin
        v_ledger_id := 'LEDG_'
                       || to_char(systimestamp, 'YYYYMMDDHH24MISSFF')
                       || '_'
                       || p_subject_id;

        begin
            select
                current_hash
            into v_prev_hash
            from
                consent_ledger
            where
                    subject_id = p_subject_id
                and type_id = p_type_id
            order by
                created_date desc
            fetch first 1 row only;

        exception
            when no_data_found then
                v_prev_hash := null;
        end;

        v_current_hash := make_hash(
            p_subject_id => p_subject_id,
            p_type_id    => p_type_id,
            p_action     => p_action,
            p_prev_hash  => v_prev_hash,
            p_details    => p_details,
            p_date       => v_now
        );

        insert into consent_ledger (
            ledger_id,
            subject_id,
            type_id,
            action_type,
            previous_hash,
            current_hash,
            consent_details,
            valid_until,
            created_date
        ) values ( v_ledger_id,
                   p_subject_id,
                   p_type_id,
                   p_action,
                   v_prev_hash,
                   v_current_hash,
                   p_details,
                   p_valid_until,
                   v_now );

        commit;
    end add_consent;

    -- ============================================
    -- NEW: Verify chain for a SINGLE TYPE
    -- ============================================
    function verify_type_chain (
        p_subject_id in varchar2,
        p_type_id    in varchar2
    ) return varchar2 is

        cursor c_records is
        select
            ledger_id,
            subject_id,
            type_id,
            action_type,
            previous_hash,
            current_hash,
            consent_details,
            created_date
        from
            consent_ledger
        where
                subject_id = p_subject_id
            and type_id = p_type_id
        order by
            created_date asc;

        v_prev_hash raw(64) := null;
        v_count     number := 0;
        v_ok_count  number := 0;
    begin
        for rec in c_records loop
            v_count := v_count + 1;
            
            -- Check 1: First record should be Genesis
            if v_count = 1 then
                if rec.previous_hash is not null then
                    return 'FAIL: First record should be GENESIS';
                end if;
            else
                -- Check 2: Previous hash must match last record's current hash
                if rec.previous_hash != v_prev_hash then
                    return 'FAIL: Chain broken at '
                           || rec.ledger_id
                           || '. Expected previous: '
                           || substr(
                        rawtohex(v_prev_hash),
                        1,
                        16
                    )
                           || '... but found: '
                           || substr(
                        nvl(
                            rawtohex(rec.previous_hash),
                            'NULL'
                        ),
                        1,
                        16
                    );

                end if;
            end if;
            
            -- Check 3: Verify hash integrity
            if rec.current_hash != make_hash(rec.subject_id, rec.type_id, rec.action_type, rec.previous_hash, rec.consent_details,
                                             rec.created_date) then
                return 'FAIL: Hash mismatch at '
                       || rec.ledger_id
                       || ' - DATA TAMPERED!';
            end if;

            v_prev_hash := rec.current_hash;
            v_ok_count := v_ok_count + 1;
        end loop;

        if v_count = 0 then
            return 'NO RECORDS';
        end if;
        return 'PASS: All '
               || v_ok_count
               || ' records verified';
    end verify_type_chain;

    -- ============================================
    -- FIXED: Verify ALL types for a user
    -- ============================================
    function verify_chain (
        p_subject_id in varchar2
    ) return varchar2 is

        cursor c_types is
        select distinct
            type_id
        from
            consent_ledger
        where
            subject_id = p_subject_id
        order by
            type_id;

        v_type_result   varchar2(4000);
        v_type_count    number := 0;
        v_fail_count    number := 0;
        v_pass_count    number := 0;
        v_total_records number := 0;
    begin
        for type_rec in c_types loop
            v_type_count := v_type_count + 1;
            
            -- Verify each type's chain separately
            v_type_result := verify_type_chain(p_subject_id, type_rec.type_id);
            if v_type_result like 'FAIL%' then
                v_fail_count := v_fail_count + 1;
                return 'FAIL: '
                       || type_rec.type_id
                       || ' - '
                       || v_type_result;
            else
                v_pass_count := v_pass_count + 1;
                -- Extract record count from result
                v_total_records := v_total_records + to_number ( regexp_substr(v_type_result, '\d+') );
            end if;

        end loop;

        if v_type_count = 0 then
            return 'NO RECORDS FOUND';
        end if;
        if v_fail_count > 0 then
            return 'FAIL: '
                   || v_fail_count
                   || ' of '
                   || v_type_count
                   || ' type chains broken';
        else
            return 'PASS: All '
                   || v_total_records
                   || ' records verified across '
                   || v_type_count
                   || ' type chains. Chain intact.';
        end if;

    end verify_chain;

    procedure send_tamper_alert (
        p_subject_id      in varchar2,
        p_type_id         in varchar2,
        p_ledger_id       in varchar2,
        p_recipient_email in varchar2
    ) is
        v_subject varchar2(200);
        v_body    varchar2(4000);
        v_result  varchar2(4000);
    begin
        -- Build email subject
        v_subject := 'SECURITY ALERT: Consent Ledger Tampered - User ' || p_subject_id;

        -- Get verification result
        v_result := verify_type_chain(p_subject_id, p_type_id);

        -- Build email body
        v_body := '<html>
<body style="font-family:Arial, sans-serif;">
    <h2 style="color:red;">🚨 SECURITY ALERT</h2>
    <p><b>Unauthorized tampering detected in Consent Ledger.</b></p>
    
    <table style="border-collapse:collapse; width:100%; margin:20px 0;">
        <tr style="background:#f0f0f0;">
            <td style="padding:10px; border:1px solid #ddd;"><b>User ID:</b></td>
            <td style="padding:10px; border:1px solid #ddd;">'
                  || p_subject_id
                  || '</td>
        </tr>
        <tr>
            <td style="padding:10px; border:1px solid #ddd;"><b>Consent Type:</b></td>
            <td style="padding:10px; border:1px solid #ddd;">'
                  || p_type_id
                  || '</td>
        </tr>
        <tr style="background:#f0f0f0;">
            <td style="padding:10px; border:1px solid #ddd;"><b>Ledger ID:</b></td>
            <td style="padding:10px; border:1px solid #ddd;">'
                  || p_ledger_id
                  || '</td>
        </tr>
        <tr>
            <td style="padding:10px; border:1px solid #ddd;"><b>Status:</b></td>
            <td style="padding:10px; border:1px solid #ddd; color:red;"><b>'
                  || v_result
                  || '</b></td>
        </tr>
        <tr style="background:#f0f0f0;">
            <td style="padding:10px; border:1px solid #ddd;"><b>Detected At:</b></td>
            <td style="padding:10px; border:1px solid #ddd;">'
                  || to_char(current_timestamp, 'YYYY-MM-DD HH24:MI:SS')
                  || '</td>
        </tr>
    </table>
    
    <p style="color:red; font-weight:bold;">⚠️ Immediate action required. Please review the consent ledger.</p>
    
    <p>Access the Consent Ledger application to investigate.</p>
</body>
</html>';

        -- Send email using APEX_MAIL
        apex_mail.send(
            p_to        => p_recipient_email,
            p_from      => 'consent-ledger@yourcompany.com',
            p_subj      => v_subject,
            p_body      => v_body,
            p_body_html => v_body
        );

        -- Also log to database
        insert into ledger_alerts (
            alert_id,
            subject_id,
            type_id,
            ledger_id,
            alert_type,
            alert_message,
            email_sent,
            created_date
        ) values ( 'ALERT_' || to_char(systimestamp, 'YYYYMMDDHH24MISSFF'),
                   p_subject_id,
                   p_type_id,
                   p_ledger_id,
                   'TAMPER_DETECTED',
                   v_result,
                   'Y',
                   current_timestamp );

        commit;
    end send_tamper_alert;

end consent_ledger_pkg;
/


-- sqlcl_snapshot {"hash":"9a479d949f9684d113b09f601509012f265c31e1","type":"PACKAGE_BODY","name":"CONSENT_LEDGER_PKG","schemaName":"XXVENTURI","sxml":""}