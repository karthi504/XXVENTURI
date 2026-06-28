alter table xxventuri.eba_sales_verifications
    add constraint eba_sales_verif_contact_fk
        foreign key ( contact_id )
            references xxventuri.eba_sales_customer_contacts ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"ce6cfd2fcd60de0bf2e3089d71b3c7dc71073665","type":"REF_CONSTRAINT","name":"EBA_SALES_VERIF_CONTACT_FK","schemaName":"XXVENTURI","sxml":""}