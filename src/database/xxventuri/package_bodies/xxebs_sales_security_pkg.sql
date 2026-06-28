create or replace package body xxventuri.xxebs_sales_security_pkg as

    encryption_type pls_integer := dbms_crypto.encrypt_des + dbms_crypto.chain_cbc + dbms_crypto.pad_pkcs5;
    encryption_key  raw(32) := utl_raw.cast_to_raw('FOURAAI_APPS');

    function get_user_authentication (
        p_username in varchar2,
        p_password in varchar2
    ) return boolean as
        lv_exists char(1);
    begin
        select
            '1'
        into lv_exists
        from
            eba_sales_salesreps e
        where
                upper(e.user_name) = upper(p_username)
            and e.password = xxebs_sales_security_pkg.encrypt(p_password);
		 -- AND e.STATUS = 'Y'          	
        return true;
    exception
        when others then
            return false;
    end get_user_authentication;

    function get_password_hash_value (
        p_password in varchar2
    ) return varchar2 is
        l_pwd_hash varchar2(100);
    begin
		/*  l_pwd_hash :=RAWTOHEX(UTL_RAW.cast_to_raw(DBMS_OBFUSCATION_TOOLKIT.md5 (input_string=> p_password)));  */

        l_pwd_hash := xxebs_sales_security_pkg.encrypt(p_password);
        return l_pwd_hash;
    end get_password_hash_value;

    procedure clear_tally_records is

        cursor c_invoice is
        select
            rowid
        from
            (
                select
                    rowid,
                    dense_rank()
                    over(
                        order by
                            batch_sequence desc
                    ) invoice_rank
                from
                    xxeba_tally_invoices_t
            )
        where
            invoice_rank > 3;

        type delrow_type is
            table of rowid index by binary_integer;
        v_records    delrow_type;
        v_start_time number;
        v_limit      number := 5000;
        cursor c_stock is
        select
            rowid
        from
            (
                select
                    rowid,
                    dense_rank()
                    over(
                        order by
                            batch_sequence desc
                    ) stock_rank
                from
                    xxeba_tally_stock_t
            )
        where
            stock_rank > 3;

        s_records    delrow_type;
        s_start_time number;
        s_limit      number := 5000;
        cursor c_receivables is
        select
            rowid
        from
            (
                select
                    rowid,
                    dense_rank()
                    over(
                        order by
                            batch_number desc
                    ) received_rank
                from
                    xxeba_tally_receivables_t
            )
        where
            received_rank > 3;

        r_records    delrow_type;
        r_start_time number;
        r_limit      number := 5000;
    begin
        begin
            open c_invoice;
            loop
                fetch c_invoice
                bulk collect into v_records limit v_limit;
                v_start_time := dbms_utility.get_time;
                forall vloop in v_records.first..v_records.last save exceptions
                    delete from xxeba_tally_invoices_t
                    where
                        rowid = v_records(vloop);

                commit;
                exit when c_invoice%notfound;
            end loop;

            close c_invoice;
        exception
            when others then
                null;
        end;
  
  --DBMS_OUTPUT.put_line('Bulk Delete using ROWID : ' || (DBMS_UTILITY.get_time - v_start_time));
        begin
            open c_stock;
            loop
                fetch c_stock
                bulk collect into s_records limit s_limit;
                s_start_time := dbms_utility.get_time;
                forall vloop in s_records.first..s_records.last save exceptions
                    delete from xxeba_tally_stock_t
                    where
                        rowid = s_records(vloop);

                commit;
                exit when c_stock%notfound;
            end loop;

            close c_stock;
        exception
            when others then
                null;
        end;
	
	--DBMS_OUTPUT.put_line('Bulk Delete using ROWID : ' || (DBMS_UTILITY.get_time - s_start_time));
        begin
            open c_receivables;
            loop
                fetch c_receivables
                bulk collect into r_records limit r_limit;
                r_start_time := dbms_utility.get_time;
                forall vloop in r_records.first..r_records.last save exceptions
                    delete from xxeba_tally_receivables_t
                    where
                        rowid = r_records(vloop);

                commit;
                exit when c_receivables%notfound;
            end loop;

            close c_receivables;
  --DBMS_OUTPUT.put_line('Bulk Delete using ROWID : ' || (DBMS_UTILITY.get_time - r_start_time));
        exception
            when others then
                null;
        end;

    exception
        when others then
            null;
    end clear_tally_records;

    function get_location_details (
        p_att_id in number,
        p1       in varchar2
    ) return varchar2 is

        lv_string           varchar2(1000);
        lv_admin_area       varchar2(1000);
        lv_country_code     varchar2(1000);
        lv_country_name     varchar2(1000);
        lv_feature_name     varchar2(1000);
        lv_locality         varchar2(1000);
        lv_postal_code      varchar2(1000);
        lv_sub_admin_area   varchar2(1000);
        lv_sub_locality     varchar2(1000);
        lv_sub_thoroughfare varchar2(1000);
        lv_thoroughfare     varchar2(1000);
        lv_location         varchar2(1000);
    begin
        if p1 = 'IN' then
            select
                attend_in_location
            into lv_string
            from
                xxeba_sales_attendance_t
            where
                att_id = p_att_id;

        elsif p1 = 'OUT' then
            select
                attend_out_location
            into lv_string
            from
                xxeba_sales_attendance_t
            where
                att_id = p_att_id;

        end if;

        lv_admin_area := trim(replace(
            regexp_substr(lv_string, '[^,]+', 1, 1),
            'AdminArea:',
            ''
        ));

        lv_country_code := trim(replace(
            regexp_substr(lv_string, '[^,]+', 1, 2),
            'CountryCode:',
            ''
        ));

        lv_country_name := trim(replace(
            regexp_substr(lv_string, '[^,]+', 1, 3),
            'CountryName:',
            ''
        ));

        lv_feature_name := trim(replace(
            regexp_substr(lv_string, '[^,]+', 1, 4),
            'FeatureName:',
            ''
        ));

        lv_locality := trim(replace(
            regexp_substr(lv_string, '[^,]+', 1, 5),
            'Locality:',
            ''
        ));

        lv_postal_code := trim(replace(
            regexp_substr(lv_string, '[^,]+', 1, 6),
            'PostalCode:',
            ''
        ));

        lv_sub_admin_area := trim(replace(
            regexp_substr(lv_string, '[^,]+', 1, 7),
            'SubAdminArea:',
            ''
        ));

        lv_sub_locality := trim(replace(
            regexp_substr(lv_string, '[^,]+', 1, 8),
            'SubLocality:',
            ''
        ));

        lv_sub_thoroughfare := trim(replace(
            regexp_substr(lv_string, '[^,]+', 1, 9),
            'SubThoroughfare:',
            ''
        ));

        lv_thoroughfare := trim(replace(
            regexp_substr(lv_string, '[^,]+', 1, 10),
            'Thoroughfare:',
            ''
        ));

        lv_location := lv_feature_name
                       || ', '
                       || lv_sub_locality
                       || ', '
                       || lv_locality;
        return replace(lv_location, ', ,', '-');
    exception
        when others then
            return null;
    end;

    function encrypt (
        p_plaintext varchar2
    ) return raw
        deterministic
    is
        encrypted_raw raw(2000);
    begin
        encrypted_raw := dbms_crypto.encrypt(
            src => utl_raw.cast_to_raw(p_plaintext),
            typ => encryption_type,
            key => encryption_key
        );

        return encrypted_raw;
    end encrypt;

    function decrypt (
        p_encryptedtext raw
    ) return varchar2
        deterministic
    is
        decrypted_raw raw(2000);
    begin
        decrypted_raw := dbms_crypto.decrypt(
            src => p_encryptedtext,
            typ => encryption_type,
            key => encryption_key
        );

        return ( utl_raw.cast_to_varchar2(decrypted_raw) );
    end decrypt;

end xxebs_sales_security_pkg;
/


-- sqlcl_snapshot {"hash":"e29714bed35830cbdfad216368491a160a546173","type":"PACKAGE_BODY","name":"XXEBS_SALES_SECURITY_PKG","schemaName":"XXVENTURI","sxml":""}