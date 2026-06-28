alter table xxventuri.eba_sales_deals
    add constraint eba_sales_deals_terr_fk
        foreign key ( territory_id_old )
            references xxventuri.eba_sales_territories ( id )
        enable;


-- sqlcl_snapshot {"hash":"36f8246932ce3db6914aa83c334f7cf5a281d892","type":"REF_CONSTRAINT","name":"EBA_SALES_DEALS_TERR_FK","schemaName":"XXVENTURI","sxml":""}