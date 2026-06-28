alter table xxventuri.eba_sales_links
    add constraint eba_sales_links_acct_fk
        foreign key ( account_id )
            references xxventuri.eba_sales_customers ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"1433a58348bd7d7932d093bea42a7570b7075c90","type":"REF_CONSTRAINT","name":"EBA_SALES_LINKS_ACCT_FK","schemaName":"XXVENTURI","sxml":""}