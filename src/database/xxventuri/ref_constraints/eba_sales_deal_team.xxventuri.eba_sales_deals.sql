alter table xxventuri.eba_sales_deal_team
    add
        foreign key ( deal_id )
            references xxventuri.eba_sales_deals ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"28ba0be4881cd21d2c5aa56df22943cc261f18c8","type":"REF_CONSTRAINT","name":"EBA_SALES_DEAL_TEAM.XXVENTURI.EBA_SALES_DEALS","schemaName":"XXVENTURI","sxml":""}