alter table xxventuri.eba_sales_deals
    add
        foreign key ( risk_assessment_id )
            references xxventuri.eba_sales_risk_assessments ( id )
        enable;


-- sqlcl_snapshot {"hash":"48a11094e5444f32d7dbabe9920b312965138ed7","type":"REF_CONSTRAINT","name":"EBA_SALES_DEALS.XXVENTURI.EBA_SALES_RISK_ASSESSMENTS","schemaName":"XXVENTURI","sxml":""}