create or replace editionable trigger xxventuri.biu_xxeba_sales_product_brands before
    insert or update on xxventuri.xxeba_sales_product_brands
    for each row
begin
    if
        inserting
        and :new.brand_id is null
    then
        select
            xxeba_sales_brands_seq.nextval
        into :new.brand_id
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
        :new.status := 'Y';
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

alter trigger xxventuri.biu_xxeba_sales_product_brands enable;


-- sqlcl_snapshot {"hash":"44ab1a2b9fffeed40b1c4840d70913e9f8689a57","type":"TRIGGER","name":"BIU_XXEBA_SALES_PRODUCT_BRANDS","schemaName":"XXVENTURI","sxml":""}