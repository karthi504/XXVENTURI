alter table xxventuri.eba_sales_links
    add constraint eba_sales_links_terr_fk
        foreign key ( territory_id )
            references xxventuri.eba_sales_territories ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"63a47fda37a033eec444b08d2ac914f257b0252d","type":"REF_CONSTRAINT","name":"EBA_SALES_LINKS_TERR_FK","schemaName":"XXVENTURI","sxml":""}