create or replace editionable trigger xxventuri.xxeba_product_class_biu before
    insert or update on xxventuri.xxeba_product_class
    for each row
declare begin
    if
        inserting
        and :new.id is null
    then
        select
            xxeba_product_class_seq.nextval
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

alter trigger xxventuri.xxeba_product_class_biu enable;


-- sqlcl_snapshot {"hash":"7723bdad60b3f435db7c8fb17acd790be0e2cd3f","type":"TRIGGER","name":"XXEBA_PRODUCT_CLASS_BIU","schemaName":"XXVENTURI","sxml":""}