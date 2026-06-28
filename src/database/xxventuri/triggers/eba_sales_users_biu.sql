create or replace editionable trigger xxventuri.eba_sales_users_biu before
    insert or update on xxventuri.eba_sales_users
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := eba_sales_acl_api.gen_id();
        end if;

        :new.created_by := nvl(
            v('APP_USER'),
            user
        );
        :new.created := localtimestamp;
        :new.row_version := 1;
        if :new.account_locked is null then
            :new.account_locked := 'N';
        end if;

    end if;

    if updating then
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated := localtimestamp;
        :new.row_version := nvl(:old.row_version,
                                1) + 1;
    end if;
    -- Always store username as upper case
    :new.username := upper(:new.username);
end;
/

alter trigger xxventuri.eba_sales_users_biu enable;


-- sqlcl_snapshot {"hash":"34e6f1ec565beb54c562cefb7a9866a719ec553f","type":"TRIGGER","name":"EBA_SALES_USERS_BIU","schemaName":"XXVENTURI","sxml":""}