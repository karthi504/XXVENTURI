alter table xxventuri.eba_sales_files
    add constraint eba_sales_files_acct_fk
        foreign key ( account_id )
            references xxventuri.eba_sales_customers ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"c3e4876a1e68b0c42ac3f2d2b41f2528578dae4a","type":"REF_CONSTRAINT","name":"EBA_SALES_FILES_ACCT_FK","schemaName":"XXVENTURI","sxml":""}