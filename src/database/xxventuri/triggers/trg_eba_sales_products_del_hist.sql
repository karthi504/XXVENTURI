create or replace editionable trigger xxventuri.trg_eba_sales_products_del_hist before
    delete on xxventuri.eba_sales_products
    for each row
begin
    insert into eba_sales_products_del_hist (
        hist_id,
        product_id,
        row_key,
        product_name,
        product_description,
        product_family_id,
        product_sku,
        product_price,
        product_type_id,
        currency_type,
        catalogue_no,
        att_mimetype,
        att_filename,
        product_cost,
        product_currency_type,
        brand_id,
        unit_of_measure,
        lead_time,
        minimum_order_quantity,
        duration_type,
        stock_id,
        status,
        product_group,
        location,
        deleted_by,
        deleted_on
    ) values ( eba_sales_products_del_hist_seq.nextval,
               :old.id,
               :old.row_key,
               :old.product_name,
               :old.product_description,
               :old.product_family_id,
               :old.product_sku,
               :old.product_price,
               :old.product_type_id,
               :old.currency_type,
               :old.catalogue_no,
               :old.att_mimetype,
               :old.att_filename,
               :old.product_cost,
               :old.product_currency_type,
               :old.brand_id,
               :old.unit_of_measure,
               :old.lead_time,
               :old.minimum_order_quantity,
               :old.duration_type,
               :old.stock_id,
               :old.status,
               :old.product_group,
               :old.location,
               nvl(apex_application.g_user, user),
               localtimestamp );

end;
/

alter trigger xxventuri.trg_eba_sales_products_del_hist enable;


-- sqlcl_snapshot {"hash":"cf26f34778307a72ad793b3d3ce434bff7c63f69","type":"TRIGGER","name":"TRG_EBA_SALES_PRODUCTS_DEL_HIST","schemaName":"XXVENTURI","sxml":""}