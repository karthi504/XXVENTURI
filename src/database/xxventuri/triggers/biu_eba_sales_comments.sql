create or replace editionable trigger xxventuri.biu_eba_sales_comments before
    insert or update on xxventuri.eba_sales_comments
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
        :new.row_key := eba_sales_fw.compress_int(eba_sales_rowkey_seq.nextval);
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

alter trigger xxventuri.biu_eba_sales_comments enable;


-- sqlcl_snapshot {"hash":"6ac2d2a1efdc1f362646855d244daff900011cdf","type":"TRIGGER","name":"BIU_EBA_SALES_COMMENTS","schemaName":"XXVENTURI","sxml":""}