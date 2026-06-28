alter table xxventuri.eba_sales_files
    add constraint eba_sales_files_terr_fk
        foreign key ( territory_id )
            references xxventuri.eba_sales_territories ( id )
        enable;


-- sqlcl_snapshot {"hash":"a33fd5f096b9a76e9c81e811676ec7f5ff6af1fb","type":"REF_CONSTRAINT","name":"EBA_SALES_FILES_TERR_FK","schemaName":"XXVENTURI","sxml":""}