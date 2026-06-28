create or replace editionable trigger xxventuri.biu_xxeba_sales_acc_products before
    insert or update on xxventuri.xxeba_sales_acc_products
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

alter trigger xxventuri.biu_xxeba_sales_acc_products enable;


-- sqlcl_snapshot {"hash":"bfeead25df950ce2f2143fa2116a35381df94818","type":"TRIGGER","name":"BIU_XXEBA_SALES_ACC_PRODUCTS","schemaName":"XXVENTURI","sxml":""}