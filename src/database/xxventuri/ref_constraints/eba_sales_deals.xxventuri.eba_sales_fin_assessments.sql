alter table xxventuri.eba_sales_deals
    add
        foreign key ( financial_assessment_id )
            references xxventuri.eba_sales_fin_assessments ( id )
        enable;


-- sqlcl_snapshot {"hash":"cf3814a363c8138a7efed3320226da2dbfc6e80b","type":"REF_CONSTRAINT","name":"EBA_SALES_DEALS.XXVENTURI.EBA_SALES_FIN_ASSESSMENTS","schemaName":"XXVENTURI","sxml":""}