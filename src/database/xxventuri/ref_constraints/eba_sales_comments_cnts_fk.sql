alter table xxventuri.eba_sales_comments
    add constraint eba_sales_comments_cnts_fk
        foreign key ( contact_id )
            references xxventuri.eba_sales_customer_contacts ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"63ce199766689d941fb21cac48e195dc32ec9821","type":"REF_CONSTRAINT","name":"EBA_SALES_COMMENTS_CNTS_FK","schemaName":"XXVENTURI","sxml":""}