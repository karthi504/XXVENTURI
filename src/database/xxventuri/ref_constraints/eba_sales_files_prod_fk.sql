alter table xxventuri.eba_sales_files
    add constraint eba_sales_files_prod_fk
        foreign key ( product_id )
            references xxventuri.eba_sales_products ( id )
        enable;


-- sqlcl_snapshot {"hash":"af9ea89f466fcb39ea8e48809b08954ff02ac3f5","type":"REF_CONSTRAINT","name":"EBA_SALES_FILES_PROD_FK","schemaName":"XXVENTURI","sxml":""}