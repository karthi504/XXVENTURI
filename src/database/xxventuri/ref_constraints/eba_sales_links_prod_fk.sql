alter table xxventuri.eba_sales_links
    add constraint eba_sales_links_prod_fk
        foreign key ( product_id )
            references xxventuri.eba_sales_products ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"1d2dc1f669004a9edf489e4e7a11630ac0ce1f84","type":"REF_CONSTRAINT","name":"EBA_SALES_LINKS_PROD_FK","schemaName":"XXVENTURI","sxml":""}