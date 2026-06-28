alter table xxventuri.eba_sales_deal_team
    add
        foreign key ( rep_id )
            references xxventuri.eba_sales_salesreps ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"062174be1dabcdae61729183f102981f6e7113e1","type":"REF_CONSTRAINT","name":"EBA_SALES_DEAL_TEAM.XXVENTURI.EBA_SALES_SALESREPS","schemaName":"XXVENTURI","sxml":""}