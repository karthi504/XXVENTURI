create or replace editionable trigger xxventuri.biu_eba_sales_customers_locs before
    insert or update on xxventuri.eba_sales_customer_locations
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
        :new.row_key := to_char(lpad(eba_sales_customer_loc_seq.nextval, 5, '0'));

        :new.row_version_number := 1;
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

alter trigger xxventuri.biu_eba_sales_customers_locs enable;


-- sqlcl_snapshot {"hash":"64e540a3cbe5da9e7d0f7f98c7a8833189b7f63e","type":"TRIGGER","name":"BIU_EBA_SALES_CUSTOMERS_LOCS","schemaName":"XXVENTURI","sxml":""}