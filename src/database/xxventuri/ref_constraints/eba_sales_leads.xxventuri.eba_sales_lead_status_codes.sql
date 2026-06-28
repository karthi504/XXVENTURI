alter table xxventuri.eba_sales_leads
    add
        foreign key ( lead_status_id )
            references xxventuri.eba_sales_lead_status_codes ( id )
        enable;


-- sqlcl_snapshot {"hash":"9981edba1cf30d531ca22b0e876c8309a2ee6d15","type":"REF_CONSTRAINT","name":"EBA_SALES_LEADS.XXVENTURI.EBA_SALES_LEAD_STATUS_CODES","schemaName":"XXVENTURI","sxml":""}