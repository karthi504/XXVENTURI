create or replace editionable trigger xxventuri.xxeba_sales_permissions_biu before
    insert or update on xxventuri.xxeba_sales_permissions_t
    for each row
declare begin
    if
        inserting
        and :new.request_id is null
    then
        select
            xxeba_sales_permissions_seq.nextval
        into :new.request_id
        from
            dual;

    end if;

    if inserting then
        :new.status := 'Y';
        :new.permission_status := 'S';
        :new.created_by := nvl(
            v('APP_USER'),
            user
        );
        :new.creation_date := localtimestamp;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.update_date := localtimestamp;
    end if;

    if updating then
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.update_date := localtimestamp;
    end if;

end;
/

alter trigger xxventuri.xxeba_sales_permissions_biu enable;


-- sqlcl_snapshot {"hash":"cd14eb05bf866619bd75f55cc01705997c535699","type":"TRIGGER","name":"XXEBA_SALES_PERMISSIONS_BIU","schemaName":"XXVENTURI","sxml":""}