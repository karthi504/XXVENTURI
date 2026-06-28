create or replace editionable trigger xxventuri.biu_eba_sales_deal_products before
    insert or update on xxventuri.eba_sales_deal_products
    for each row
begin
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

    for c1 in (
        select
            period_name
        from
            eba_sales_sales_periods
        where
            trunc(:new.close_date) between trunc(first_day) and trunc(last_day)
    ) loop
        :new.qtr := c1.period_name;
    end loop;

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
        :new.row_key := eba_sales_fw.compress_int(eba_sales_rowkey_seq.nextval);
        :new.row_version_number := 1;
        :new.status := 'Y';
    end if;

    if updating then
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated := localtimestamp;
        :new.row_version_number := nvl(:old.row_version_number,
                                       1) + 1;
    end if;

end;
/

alter trigger xxventuri.biu_eba_sales_deal_products enable;


-- sqlcl_snapshot {"hash":"4f3e8b0b87cc05e54642a26ba02b70d6a2fbd0c2","type":"TRIGGER","name":"BIU_EBA_SALES_DEAL_PRODUCTS","schemaName":"XXVENTURI","sxml":""}