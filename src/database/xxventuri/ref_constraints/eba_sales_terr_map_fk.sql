alter table xxventuri.eba_sales_terr_map
    add constraint eba_sales_terr_map_fk
        foreign key ( territory_id )
            references xxventuri.eba_sales_territories ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"6e429d3d9f43a4bcb9fe57e84adcec2b358c9ebd","type":"REF_CONSTRAINT","name":"EBA_SALES_TERR_MAP_FK","schemaName":"XXVENTURI","sxml":""}