alter table xxventuri.eba_sales_verifications
    add
        foreign key ( territory_id )
            references xxventuri.eba_sales_territories ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"93de74fe50301ffab6d6efd6e9e28260cc8cc0e7","type":"REF_CONSTRAINT","name":"EBA_SALES_VERIFICATIONS.XXVENTURI.EBA_SALES_TERRITORIES","schemaName":"XXVENTURI","sxml":""}