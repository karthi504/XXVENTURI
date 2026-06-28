create or replace editionable trigger xxventuri.xxeba_sales_product_types_biu before
    insert or update on xxventuri.xxeba_sales_product_types
    for each row
declare begin
    if
        inserting
        and :new.product_type_id is null
    then
        select
            xxeba_sales_product_types_seq.nextval
        into :new.product_type_id
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

alter trigger xxventuri.xxeba_sales_product_types_biu enable;


-- sqlcl_snapshot {"hash":"6e93ac78ce401f52aba5d87af93bfa355d991f3a","type":"TRIGGER","name":"XXEBA_SALES_PRODUCT_TYPES_BIU","schemaName":"XXVENTURI","sxml":""}