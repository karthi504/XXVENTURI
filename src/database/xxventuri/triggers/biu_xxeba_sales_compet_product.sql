create or replace editionable trigger xxventuri.biu_xxeba_sales_compet_product before
    insert or update on xxventuri.xxeba_sales_competitor_product
    for each row
begin
    if inserting then
        if :new.id is null then
            select
                to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
            into :new.id
            from
                dual;

        end if;

        :new.status := 'Y';
        :new.creation_date := localtimestamp;
        :new.created_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.update_date := localtimestamp;
    end if;

    if updating then
        :new.update_date := localtimestamp;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
    end if;

end;
/

alter trigger xxventuri.biu_xxeba_sales_compet_product enable;


-- sqlcl_snapshot {"hash":"3e4999d5ae3071f71339fcb4c0ba9960694c236e","type":"TRIGGER","name":"BIU_XXEBA_SALES_COMPET_PRODUCT","schemaName":"XXVENTURI","sxml":""}