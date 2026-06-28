alter table xxventuri.eba_sales_verifications
    add constraint eba_sales_verif_product_fk
        foreign key ( product_id )
            references xxventuri.eba_sales_products ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"9701158f62cd606e97e6b6da0645b2709a2a83ca","type":"REF_CONSTRAINT","name":"EBA_SALES_VERIF_PRODUCT_FK","schemaName":"XXVENTURI","sxml":""}