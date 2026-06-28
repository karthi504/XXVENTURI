alter table xxventuri.eba_sales_files
    add constraint eba_sales_files_fk
        foreign key ( deal_id )
            references xxventuri.eba_sales_deals ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"c31dd1b048b33f2d3a50315ccafd642a263b54af","type":"REF_CONSTRAINT","name":"EBA_SALES_FILES_FK","schemaName":"XXVENTURI","sxml":""}