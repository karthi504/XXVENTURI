alter table xxventuri.eba_sales_territory_acl
    add constraint eba_sales_terr_acl_fk
        foreign key ( territory_id )
            references xxventuri.eba_sales_territories ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"2c524b7d799501859ef2c5af208488683abc1d24","type":"REF_CONSTRAINT","name":"EBA_SALES_TERR_ACL_FK","schemaName":"XXVENTURI","sxml":""}