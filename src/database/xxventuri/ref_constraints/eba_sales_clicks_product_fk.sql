alter table xxventuri.eba_sales_clicks
    add constraint eba_sales_clicks_product_fk
        foreign key ( product_id )
            references xxventuri.eba_sales_products ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"61e0718c76a365908c2450b9ca919ab15bb4343e","type":"REF_CONSTRAINT","name":"EBA_SALES_CLICKS_PRODUCT_FK","schemaName":"XXVENTURI","sxml":""}