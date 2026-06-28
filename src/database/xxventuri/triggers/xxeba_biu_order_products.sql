create or replace editionable trigger xxventuri.xxeba_biu_order_products before
    insert or update on xxventuri.xxeba_order_products
    for each row
declare begin
    if
        inserting
        and :new.order_products_id is null
    then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.order_products_id
        from
            dual;

    end if;

    if inserting then
        :new.created := localtimestamp;
        :new.created_by := nvl(wwv_flow.g_user, user);
        :new.updated := localtimestamp;
        :new.updated_by := nvl(wwv_flow.g_user, user);
        :new.row_key := to_char(lpad(xxeba_order_products_seq.nextval, 5, '0'));

        :new.status := 'Y';	
	-- :new.row_version_number := 1;       
    elsif updating then       
	--:new.row_version_number := nvl(:old.row_version_number,1) + 1;         
        :new.updated := localtimestamp;
        :new.updated_by := nvl(wwv_flow.g_user, user);
    end if;

end;
/

alter trigger xxventuri.xxeba_biu_order_products enable;


-- sqlcl_snapshot {"hash":"651b6b85fc9d54a2c17489528697a3d5b36e021d","type":"TRIGGER","name":"XXEBA_BIU_ORDER_PRODUCTS","schemaName":"XXVENTURI","sxml":""}