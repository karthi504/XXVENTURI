create or replace editionable trigger xxventuri.xxeba_sales_person_target_biu before
    insert or update on xxventuri.xxeba_sales_person_target
    for each row
begin
    if
        inserting
        and :new.target_id is null
    then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.target_id
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

alter trigger xxventuri.xxeba_sales_person_target_biu enable;


-- sqlcl_snapshot {"hash":"2bffd8f1d5a5ccf5f1ff28d2560ef60f88c1e5c2","type":"TRIGGER","name":"XXEBA_SALES_PERSON_TARGET_BIU","schemaName":"XXVENTURI","sxml":""}