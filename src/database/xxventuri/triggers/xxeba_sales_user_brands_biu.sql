create or replace editionable trigger xxventuri.xxeba_sales_user_brands_biu before
    insert or update or delete on xxventuri.xxeba_sales_user_brands
    for each row
declare begin
    if inserting then
        :new.user_brand_id := xxeba_sales_user_brands_seq.nextval;
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

alter trigger xxventuri.xxeba_sales_user_brands_biu enable;


-- sqlcl_snapshot {"hash":"f8e3ba030a56bdf6d1dc178c07a94059efff5571","type":"TRIGGER","name":"XXEBA_SALES_USER_BRANDS_BIU","schemaName":"XXVENTURI","sxml":""}