create or replace editionable trigger xxventuri.xxeba_list_values_biu before
    insert or update on xxventuri.xxeba_list_values
    for each row
declare begin
    if
        inserting
        and :new.list_id is null
    then
        select
            xxeba_list_values_seq.nextval
        into :new.list_id
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

alter trigger xxventuri.xxeba_list_values_biu enable;


-- sqlcl_snapshot {"hash":"8edb58ddceb0303d3a4b8f8c906e1c2caf290d8d","type":"TRIGGER","name":"XXEBA_LIST_VALUES_BIU","schemaName":"XXVENTURI","sxml":""}