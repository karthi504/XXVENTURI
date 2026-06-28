alter table xxventuri.eba_sales_clicks
    add constraint eba_sales_clicks_terr_fk
        foreign key ( territory_id )
            references xxventuri.eba_sales_territories ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"ec7150ba5715da6ec2b1c5bdb9d59c339863ec4c","type":"REF_CONSTRAINT","name":"EBA_SALES_CLICKS_TERR_FK","schemaName":"XXVENTURI","sxml":""}