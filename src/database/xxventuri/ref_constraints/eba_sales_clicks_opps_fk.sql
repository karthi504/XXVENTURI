alter table xxventuri.eba_sales_clicks
    add constraint eba_sales_clicks_opps_fk
        foreign key ( opp_id )
            references xxventuri.eba_sales_deals ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"decb68e6f21d239b554dbf403cf290365d8f187c","type":"REF_CONSTRAINT","name":"EBA_SALES_CLICKS_OPPS_FK","schemaName":"XXVENTURI","sxml":""}