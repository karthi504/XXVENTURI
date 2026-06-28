alter table xxventuri.eba_sales_act_competition
    add constraint eba_sales_act_comp_fk
        foreign key ( competitor_id )
            references xxventuri.eba_sales_competitors ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"e0767561edc83d127715868bba832cd8b5946f49","type":"REF_CONSTRAINT","name":"EBA_SALES_ACT_COMP_FK","schemaName":"XXVENTURI","sxml":""}