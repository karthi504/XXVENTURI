alter table xxventuri.eba_sales_terr_map
    add constraint eba_sales_terr_map_fk3
        foreign key ( state_id )
            references xxventuri.eba_sales_states ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"6cd939c4f88707847f4fade913201d4f6f411c2e","type":"REF_CONSTRAINT","name":"EBA_SALES_TERR_MAP_FK3","schemaName":"XXVENTURI","sxml":""}