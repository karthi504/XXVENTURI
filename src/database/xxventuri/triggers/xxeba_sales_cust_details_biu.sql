create or replace editionable trigger xxventuri.xxeba_sales_cust_details_biu before
    insert or update on xxventuri.xxeba_sales_customer_details
    for each row
declare begin
    if
        inserting
        and :new.details_id is null
    then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.details_id
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

alter trigger xxventuri.xxeba_sales_cust_details_biu enable;


-- sqlcl_snapshot {"hash":"4c0b0b4ca57745167c26db9e0d67039c103bea32","type":"TRIGGER","name":"XXEBA_SALES_CUST_DETAILS_BIU","schemaName":"XXVENTURI","sxml":""}