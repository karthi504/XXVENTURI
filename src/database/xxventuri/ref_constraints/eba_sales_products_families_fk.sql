alter table xxventuri.eba_sales_products
    add constraint eba_sales_products_families_fk
        foreign key ( product_family_id )
            references xxventuri.eba_sales_product_families ( id )
                on delete set null
        enable;


-- sqlcl_snapshot {"hash":"91fbe78fcf7e4b30dac3f09b297d92bda549f20f","type":"REF_CONSTRAINT","name":"EBA_SALES_PRODUCTS_FAMILIES_FK","schemaName":"XXVENTURI","sxml":""}