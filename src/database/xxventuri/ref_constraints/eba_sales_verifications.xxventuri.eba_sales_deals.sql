alter table xxventuri.eba_sales_verifications
    add
        foreign key ( opp_id )
            references xxventuri.eba_sales_deals ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"2d3b25246f838c6fb722488ffb30a013c8fda264","type":"REF_CONSTRAINT","name":"EBA_SALES_VERIFICATIONS.XXVENTURI.EBA_SALES_DEALS","schemaName":"XXVENTURI","sxml":""}