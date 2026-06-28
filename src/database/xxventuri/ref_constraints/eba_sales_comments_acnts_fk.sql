alter table xxventuri.eba_sales_comments
    add constraint eba_sales_comments_acnts_fk
        foreign key ( account_id )
            references xxventuri.eba_sales_customers ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"4ecd446e4d6118d7406151f7603a69f3b3f6e1cc","type":"REF_CONSTRAINT","name":"EBA_SALES_COMMENTS_ACNTS_FK","schemaName":"XXVENTURI","sxml":""}