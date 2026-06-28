alter table xxventuri.eba_sales_comments
    add constraint eba_sales_comments_opps_fk
        foreign key ( deal_id )
            references xxventuri.eba_sales_deals ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"79a49fa1041355a9e9f9055e623eb874cfcb9459","type":"REF_CONSTRAINT","name":"EBA_SALES_COMMENTS_OPPS_FK","schemaName":"XXVENTURI","sxml":""}