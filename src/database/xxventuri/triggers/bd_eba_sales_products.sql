create or replace editionable trigger xxventuri.bd_eba_sales_products before
    delete on xxventuri.eba_sales_products
    for each row
begin
    eba_sales_fw.tag_sync(
        p_new_tags     => null,
        p_old_tags     => :old.tags,
        p_content_type => 'PRODUCT',
        p_content_id   => :old.id
    );
end;
/

alter trigger xxventuri.bd_eba_sales_products enable;


-- sqlcl_snapshot {"hash":"37acb42130a72900468d584ba55a4b48dcbf13e5","type":"TRIGGER","name":"BD_EBA_SALES_PRODUCTS","schemaName":"XXVENTURI","sxml":""}