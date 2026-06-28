create or replace editionable trigger xxventuri.xxeba_sales_kit_biu before
    insert or update on xxventuri.xxeba_sales_kit_files
    for each row
declare begin
    if
        inserting
        and :new.kit_id is null
    then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.kit_id
        from
            dual;

    end if;

    if inserting then
        :new.status := 'Y';
        :new.created_by := nvl(
            v('APP_USER'),
            user
        );
        :new.created_date := localtimestamp;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated_date := localtimestamp;
    end if;

    if updating then
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated_date := localtimestamp;
    end if;

end;
/

alter trigger xxventuri.xxeba_sales_kit_biu enable;


-- sqlcl_snapshot {"hash":"b12451ad67c59076813d8e4250f11f186d2c705c","type":"TRIGGER","name":"XXEBA_SALES_KIT_BIU","schemaName":"XXVENTURI","sxml":""}