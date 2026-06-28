alter table xxventuri.eba_sales_comments
    add constraint eba_sales_comments_prods_fk
        foreign key ( product_id )
            references xxventuri.eba_sales_products ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"063c9280d47aba9caf8f9ad27c97e7b43c580eea","type":"REF_CONSTRAINT","name":"EBA_SALES_COMMENTS_PRODS_FK","schemaName":"XXVENTURI","sxml":""}