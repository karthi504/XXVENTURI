alter table xxventuri.eba_sales_deals
    add
        foreign key ( account_standing_id )
            references xxventuri.eba_sales_account_standing ( id )
        enable;


-- sqlcl_snapshot {"hash":"dafdfab5ddd134593089e6a985eeb229d6da8476","type":"REF_CONSTRAINT","name":"EBA_SALES_DEALS.XXVENTURI.EBA_SALES_ACCOUNT_STANDING","schemaName":"XXVENTURI","sxml":""}