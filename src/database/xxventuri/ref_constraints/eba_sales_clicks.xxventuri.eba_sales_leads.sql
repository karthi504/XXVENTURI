alter table xxventuri.eba_sales_clicks
    add
        foreign key ( lead_id )
            references xxventuri.eba_sales_leads ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"0c4c872045444bcd5faf1421d019199bfa9792ce","type":"REF_CONSTRAINT","name":"EBA_SALES_CLICKS.XXVENTURI.EBA_SALES_LEADS","schemaName":"XXVENTURI","sxml":""}