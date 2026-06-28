create or replace editionable trigger xxventuri."biu_eba_sales_product_families" before
    insert or update on xxventuri.eba_sales_product_families
    for each row
begin
    if :new.id is null then
        :new.id := eba_sales_acl_api.gen_id();
    end if;

    if inserting then
        :new.created := localtimestamp;
        :new.created_by := nvl(apex_application.g_user, user);
        :new.status := 'Y';
    end if;

    :new.updated := localtimestamp;
    :new.updated_by := nvl(apex_application.g_user, user);
end;
/

alter trigger xxventuri."biu_eba_sales_product_families" enable;


-- sqlcl_snapshot {"hash":"15a1cda091469abbb988dc2254f3aa87032bd9d8","type":"TRIGGER","name":"biu_eba_sales_product_families","schemaName":"XXVENTURI","sxml":""}