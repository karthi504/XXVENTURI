alter table xxventuri.eba_sales_files
    add constraint eba_sales_files_cont_fk
        foreign key ( contact_id )
            references xxventuri.eba_sales_customer_contacts ( id )
        enable;


-- sqlcl_snapshot {"hash":"069ceb9b194178e718d6ba27b0e0397ac7a9e161","type":"REF_CONSTRAINT","name":"EBA_SALES_FILES_CONT_FK","schemaName":"XXVENTURI","sxml":""}