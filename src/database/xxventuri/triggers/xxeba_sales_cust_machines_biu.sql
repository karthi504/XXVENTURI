create or replace editionable trigger xxventuri.xxeba_sales_cust_machines_biu before
    insert or update on xxventuri.xxeba_sales_cust_machineries
    for each row
declare begin
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
        :new.status := 'Y';
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

alter trigger xxventuri.xxeba_sales_cust_machines_biu enable;


-- sqlcl_snapshot {"hash":"59763cbfa99413524c20821488ba448de0fe0341","type":"TRIGGER","name":"XXEBA_SALES_CUST_MACHINES_BIU","schemaName":"XXVENTURI","sxml":""}