alter table xxventuri.eba_sales_links
    add constraint eba_sales_link_fk
        foreign key ( deal_id )
            references xxventuri.eba_sales_deals ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"f8b2f64edd91baefe7e981c9ff91b7d2bc71b708","type":"REF_CONSTRAINT","name":"EBA_SALES_LINK_FK","schemaName":"XXVENTURI","sxml":""}