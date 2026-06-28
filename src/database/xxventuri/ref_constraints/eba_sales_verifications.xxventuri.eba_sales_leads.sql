alter table xxventuri.eba_sales_verifications
    add
        foreign key ( lead_id )
            references xxventuri.eba_sales_leads ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"5b3b33eb14f730e425eb876a390cb1c17a9113c6","type":"REF_CONSTRAINT","name":"EBA_SALES_VERIFICATIONS.XXVENTURI.EBA_SALES_LEADS","schemaName":"XXVENTURI","sxml":""}