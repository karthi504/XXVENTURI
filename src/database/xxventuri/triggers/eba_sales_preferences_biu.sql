create or replace editionable trigger xxventuri.eba_sales_preferences_biu before
    insert or update on xxventuri.eba_sales_preferences
    for each row
begin
    if
        inserting
        and :new.id is null
    then
        :new.id := eba_sales_acl_api.gen_id();
    end if;

    if inserting then
        :new.created_by := nvl(
            v('APP_USER'),
            user
        );
        :new.created_on := localtimestamp;
    end if;

    if updating then
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated_on := localtimestamp;
    end if;

    :new.preference_name := upper(:new.preference_name);
end;
/

alter trigger xxventuri.eba_sales_preferences_biu enable;


-- sqlcl_snapshot {"hash":"76c6d5d84a8287ac2564c1ab0dcd2cb73bd24ab0","type":"TRIGGER","name":"EBA_SALES_PREFERENCES_BIU","schemaName":"XXVENTURI","sxml":""}