alter table xxventuri.eba_sales_comments
    add constraint eba_sales_comments_terrs_fk
        foreign key ( territory_id )
            references xxventuri.eba_sales_territories ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"cfb4353aa87ef4e89c60e084661d37e8c06ef079","type":"REF_CONSTRAINT","name":"EBA_SALES_COMMENTS_TERRS_FK","schemaName":"XXVENTURI","sxml":""}