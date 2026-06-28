alter table xxventuri.eba_sales_leads
    add
        foreign key ( lead_source_id )
            references xxventuri.eba_sales_lead_sources ( id )
        enable;


-- sqlcl_snapshot {"hash":"ecf91ea626d959f0bcd09c921104ac7be833291a","type":"REF_CONSTRAINT","name":"EBA_SALES_LEADS.XXVENTURI.EBA_SALES_LEAD_SOURCES","schemaName":"XXVENTURI","sxml":""}