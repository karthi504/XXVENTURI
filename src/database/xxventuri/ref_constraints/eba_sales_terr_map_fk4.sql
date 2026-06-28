alter table xxventuri.eba_sales_terr_map
    add constraint eba_sales_terr_map_fk4
        foreign key ( country_id )
            references xxventuri.eba_sales_countries ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"6fc0c98f86d35de6e31c372fee6688bb69302f55","type":"REF_CONSTRAINT","name":"EBA_SALES_TERR_MAP_FK4","schemaName":"XXVENTURI","sxml":""}