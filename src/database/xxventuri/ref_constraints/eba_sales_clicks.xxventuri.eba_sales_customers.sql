alter table xxventuri.eba_sales_clicks
    add
        foreign key ( cust_id )
            references xxventuri.eba_sales_customers ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"9cfaa23e189e0ebe1e6df2f63d38e91b3d5aac01","type":"REF_CONSTRAINT","name":"EBA_SALES_CLICKS.XXVENTURI.EBA_SALES_CUSTOMERS","schemaName":"XXVENTURI","sxml":""}