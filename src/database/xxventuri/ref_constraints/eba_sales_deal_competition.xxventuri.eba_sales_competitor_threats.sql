alter table xxventuri.eba_sales_deal_competition
    add
        foreign key ( competitor_threat_id )
            references xxventuri.eba_sales_competitor_threats ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"26a092c8c33a270c601b5ac424027f2615bb9455","type":"REF_CONSTRAINT","name":"EBA_SALES_DEAL_COMPETITION.XXVENTURI.EBA_SALES_COMPETITOR_THREATS","schemaName":"XXVENTURI","sxml":""}