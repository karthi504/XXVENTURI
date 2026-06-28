create or replace editionable trigger xxventuri.bd_eba_sales_deals before
    delete on xxventuri.eba_sales_deals
    for each row
begin
    delete from eba_sales_deal_products
    where
        deal_id = :new.id;

    eba_sales_fw.tag_sync(
        p_new_tags     => null,
        p_old_tags     => :old.tags,
        p_content_type => 'DEAL',
        p_content_id   => :old.id
    );

end;
/

alter trigger xxventuri.bd_eba_sales_deals enable;


-- sqlcl_snapshot {"hash":"25637a80b08444793cfebdc6278b67870daffb64","type":"TRIGGER","name":"BD_EBA_SALES_DEALS","schemaName":"XXVENTURI","sxml":""}