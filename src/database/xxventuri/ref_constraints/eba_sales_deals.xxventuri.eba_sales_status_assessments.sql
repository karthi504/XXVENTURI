alter table xxventuri.eba_sales_deals
    add
        foreign key ( status_assessment_id )
            references xxventuri.eba_sales_status_assessments ( id )
        enable;


-- sqlcl_snapshot {"hash":"8d24e4a1b1b55b92c171d15907698c518ceeaefc","type":"REF_CONSTRAINT","name":"EBA_SALES_DEALS.XXVENTURI.EBA_SALES_STATUS_ASSESSMENTS","schemaName":"XXVENTURI","sxml":""}