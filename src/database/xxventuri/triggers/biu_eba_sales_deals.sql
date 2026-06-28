create or replace editionable trigger xxventuri.biu_eba_sales_deals before
    insert or update on xxventuri.eba_sales_deals
    for each row
declare
    ov varchar2(4000);
    nv varchar2(4000);
begin
    if :new.tags is not null then
        :new.tags := eba_sales_fw.tags_cleaner(:new.tags);
    end if;

    if :new.deal_close_date is null then
        :new.deal_close_date := add_months(sysdate, 2);
    end if;

    for c1 in (
        select
            period_name
        from
            eba_sales_sales_periods
        where
            :new.deal_close_date between first_day and last_day
    ) loop
        :new.qtr := c1.period_name;
    end loop;

    if
        inserting
        and :new.id is null
    then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.id
        from
            dual;

    end if;

    if inserting then
        :new.created_by := nvl(
            v('APP_USER'),
            user
        );
        :new.created := localtimestamp;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated := localtimestamp;
        --:new.row_key := eba_sales_fw.compress_int(eba_sales_rowkey_seq.nextval);
        :new.row_key := to_char(lpad(eba_sales_deals_seq.nextval, 5, '0'));

        :new.row_version_number := 1;
        :new.deal_close_date := sysdate;
    end if;

    if updating then
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated := localtimestamp;
        :new.row_version_number := nvl(:old.row_version_number,
                                       1) + 1;
      --  :new.DEAL_CLOSE_DATE := least (trunc(sysdate), :old.deal_close_date);
    end if;

    if
        inserting
        and :new.deal_status_code_id is not null
    then
        if :new.deal_probability is null then
            for c1 in (
                select
                    corresponding_prob_pct
                from
                    eba_sales_deal_status_codes
                where
                    id = :new.deal_status_code_id
            ) loop
                :new.deal_probability := c1.corresponding_prob_pct;
            end loop;

        end if;
    elsif
        updating
        and ( nvl(:new.deal_status_code_id,
                  3.1) != nvl(:old.deal_status_code_id,
                              3.1)
        or :new.deal_probability is null )
    then
        if :new.deal_probability is null then
            for c1 in (
                select
                    corresponding_prob_pct
                from
                    eba_sales_deal_status_codes
                where
                    id = :new.deal_status_code_id
            ) loop
                :new.deal_probability := c1.corresponding_prob_pct;
            end loop;

        end if;
    end if;
    --
    -- history
    --
    if
        updating
        and nvl(:old.tags,
                'x0') != nvl(:new.tags,
                             'x0')
    then
        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('tags'),
                   :old.tags,
                   :new.tags );

    end if;
    --
    if
        updating
        and nvl(:old.deal_currency,
                'x0') != nvl(:new.deal_currency,
                             'x0')
    then
        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('CURRENCY'),
                   :old.deal_currency,
                   :new.deal_currency );

    end if;
    --
    if
        updating
        and nvl(:old.deal_name,
                'x0') != nvl(:new.deal_name,
                             'x0')
    then
        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('opportunity_name'),
                   :old.deal_name,
                   :new.deal_name );

    end if;
    --
    if
        updating
        and nvl(:old.strategy,
                'x0') != nvl(:new.strategy,
                             'x0')
    then
        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('STRATEGY'),
                   :old.strategy,
                   :new.strategy );

    end if;
    --
    if
        updating
        and nvl(:old.deal_summary,
                'x0') != nvl(:new.deal_summary,
                             'x0')
    then
        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('summary'),
                   :old.deal_summary,
                   :new.deal_summary );

    end if;
    --
    if
        updating
        and nvl(:old.national_top_25_yn,
                'x0') != nvl(:new.national_top_25_yn,
                             'x0')
    then
        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('NATIONAL_TOP_25'),
                   :old.national_top_25_yn,
                   :new.national_top_25_yn );

    end if;
    --
    if
        updating
        and nvl(:old.partner,
                'x0') != nvl(:new.partner,
                             'x0')
    then
        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('PARTNER'),
                   :old.partner,
                   :new.partner );

    end if;
    --
    if
        updating
        and nvl(:old.qtr,
                '0') != nvl(:new.qtr,
                            '0')
    then
        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('QTR'),
                   :old.qtr,
                   :new.qtr );

    end if;
    --
    if
        updating
        and nvl(:old.pro_re_active,
                '0') != nvl(:new.pro_re_active,
                            '0')
    then
        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('PRO_RE_ACTIVE'),
                   :old.pro_re_active,
                   :new.pro_re_active );

    end if;
    --
    -- date history
    --
    if
        updating
        and to_char(:old.deal_close_date,
                    'DD-MM-YY') != to_char(:new.deal_close_date,
                                           'DD-MM-YY')
    then
        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('close_date'),
                   to_char(:old.deal_close_date,
                           'DD-MM-YY'),
                   to_char(:new.deal_close_date,
                           'DD-MM-YY') );

    end if;
    --
    -- numeric history
    --
    if
        updating
        and nvl(:old.deal_probability,
                0) != nvl(:new.deal_probability,
                          0)
    then
        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('probability'),
                   :old.deal_probability,
                   :new.deal_probability );

    end if;
    --
    if
        updating
        and nvl(:old.deal_amount,
                0) != nvl(:new.deal_amount,
                          0)
    then
        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('amount'),
                   :old.deal_amount,
                   :new.deal_amount );

    end if;
    --
    if
        updating
        and nvl(:old.deal_license,
                0) != nvl(:new.deal_license,
                          0)
    then
        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('license'),
                   :old.deal_license,
                   :new.deal_license );

    end if;
    --
    if
        updating
        and nvl(:old.deal_support,
                0) != nvl(:new.deal_support,
                          0)
    then
        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('support'),
                   :old.deal_support,
                   :new.deal_support );

    end if;
    --
    if
        updating
        and nvl(:old.deal_education,
                0) != nvl(:new.deal_education,
                          0)
    then
        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('education'),
                   :old.deal_education,
                   :new.deal_education );

    end if;
    --
    if
        updating
        and nvl(:old.deal_consulting,
                0) != nvl(:new.deal_consulting,
                          0)
    then
        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('consulting'),
                   :old.deal_consulting,
                   :new.deal_consulting );

    end if;
    --
    if
        updating
        and nvl(:old.deal_status_code_id,
                0) != nvl(:new.deal_status_code_id,
                          0)
    then
        ov := null;
        nv := null;
        for c1 in (
            select
                status_code
            from
                eba_sales_lead_status_codes c
            where
                c.id = :old.deal_status_code_id
        ) loop
            ov := c1.status_code;
        end loop;

        for c1 in (
            select
                status_code
            from
                eba_sales_lead_status_codes c
            where
                c.id = :new.deal_status_code_id
        ) loop
            nv := c1.status_code;
        end loop;

        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('status code'),
                   ov,
                   nv );

    end if;
    --
    if
        updating
        and nvl(:old.customer_id,
                0) != nvl(:new.customer_id,
                          0)
    then
        ov := null;
        nv := null;
        for c1 in (
            select
                customer_name
            from
                eba_sales_customers c
            where
                c.id = :old.customer_id
        ) loop
            ov := c1.customer_name;
        end loop;

        for c1 in (
            select
                customer_name
            from
                eba_sales_customers c
            where
                c.id = :new.customer_id
        ) loop
            nv := c1.customer_name;
        end loop;

        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('account'),
                   ov,
                   nv );

    end if;
    --
    if
        updating
        and nvl(:old.salesrep_id_01,
                0) != nvl(:new.salesrep_id_01,
                          0)
    then
        ov := null;
        nv := null;
        for c1 in (
            select
                rep_eba_sales_username,
                rep_email,
                rep_last_name,
                rep_first_name
            from
                eba_sales_salesreps c
            where
                c.id = :old.salesrep_id_01
        ) loop
            ov := nvl(
                nvl(c1.rep_email, c1.rep_first_name
                                  || ' '
                                  || c1.rep_last_name),
                c1.rep_eba_sales_username
            );
        end loop;

        for c1 in (
            select
                rep_eba_sales_username,
                rep_email,
                rep_last_name,
                rep_first_name
            from
                eba_sales_salesreps c
            where
                c.id = :new.salesrep_id_01
        ) loop
            nv := nvl(
                nvl(c1.rep_email, c1.rep_first_name
                                  || ' '
                                  || c1.rep_last_name),
                c1.rep_eba_sales_username
            );
        end loop;

        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('SALESREP_01'),
                   ov,
                   nv );

    end if;
    --
    if
        updating
        and nvl(:old.financial_assessment_id,
                0) != nvl(:new.financial_assessment_id,
                          0)
    then
        ov := null;
        nv := null;
        for c1 in (
            select
                assessment_text
            from
                eba_sales_fin_assessments c
            where
                c.id = :old.financial_assessment_id
        ) loop
            ov := c1.assessment_text;
        end loop;

        for c1 in (
            select
                assessment_text
            from
                eba_sales_fin_assessments c
            where
                c.id = :new.financial_assessment_id
        ) loop
            nv := c1.assessment_text;
        end loop;

        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('financial_assessment'),
                   ov,
                   nv );

    end if;
    --
    if
        updating
        and nvl(:old.status_assessment_id,
                0) != nvl(:new.status_assessment_id,
                          0)
    then
        ov := null;
        nv := null;
        for c1 in (
            select
                assessment_text
            from
                eba_sales_status_assessments c
            where
                c.id = :old.status_assessment_id
        ) loop
            ov := c1.assessment_text;
        end loop;

        for c1 in (
            select
                assessment_text
            from
                eba_sales_status_assessments c
            where
                c.id = :new.status_assessment_id
        ) loop
            nv := c1.assessment_text;
        end loop;

        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('status_assessment'),
                   ov,
                   nv );

    end if;
    --
    if
        updating
        and nvl(:old.risk_assessment_id,
                0) != nvl(:new.risk_assessment_id,
                          0)
    then
        ov := null;
        nv := null;
        for c1 in (
            select
                assessment_text
            from
                eba_sales_risk_assessments c
            where
                c.id = :old.risk_assessment_id
        ) loop
            ov := c1.assessment_text;
        end loop;

        for c1 in (
            select
                assessment_text
            from
                eba_sales_risk_assessments c
            where
                c.id = :new.risk_assessment_id
        ) loop
            nv := c1.assessment_text;
        end loop;

        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('risk_assessment'),
                   ov,
                   nv );

    end if;
    --
    if
        updating
        and nvl(:old.account_standing_id,
                0) != nvl(:new.account_standing_id,
                          0)
    then
        ov := null;
        nv := null;
        for c1 in (
            select
                standing_text
            from
                eba_sales_account_standing c
            where
                c.id = :old.account_standing_id
        ) loop
            ov := c1.standing_text;
        end loop;

        for c1 in (
            select
                standing_text
            from
                eba_sales_account_standing c
            where
                c.id = :new.account_standing_id
        ) loop
            nv := c1.standing_text;
        end loop;

        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('account_standing'),
                   ov,
                   nv );

    end if;
    --
    if
        updating
        and nvl(:old.svp_id,
                0) != nvl(:new.svp_id,
                          0)
    then
        ov := null;
        nv := null;
        for c1 in (
            select
                svp_name
            from
                eba_sales_svps c
            where
                c.id = :old.svp_id
        ) loop
            ov := c1.svp_name;
        end loop;

        for c1 in (
            select
                svp_name
            from
                eba_sales_svps c
            where
                c.id = :new.svp_id
        ) loop
            nv := c1.svp_name;
        end loop;

        insert into eba_sales_history (
            deal_rowkey,
            deal_id,
            column_name,
            old_value,
            new_value
        ) values ( :new.row_key,
                   :new.id,
                   upper('SVP'),
                   ov,
                   nv );

    end if;
    --
    -- tags
    --
    eba_sales_fw.tag_sync(
        p_new_tags     => :new.tags,
        p_old_tags     => :old.tags,
        p_content_type => 'DEAL',
        p_content_id   => :new.id
    );

end;
/

alter trigger xxventuri.biu_eba_sales_deals enable;


-- sqlcl_snapshot {"hash":"2c94c849f05097db3f41f732eac2c5070abb2351","type":"TRIGGER","name":"BIU_EBA_SALES_DEALS","schemaName":"XXVENTURI","sxml":""}