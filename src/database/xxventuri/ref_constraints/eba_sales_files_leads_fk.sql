alter table xxventuri.eba_sales_files
    add constraint eba_sales_files_leads_fk
        foreign key ( lead_id )
            references xxventuri.eba_sales_leads ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"85edc447e0b24db51e447eb04fb77861f81cc289","type":"REF_CONSTRAINT","name":"EBA_SALES_FILES_LEADS_FK","schemaName":"XXVENTURI","sxml":""}