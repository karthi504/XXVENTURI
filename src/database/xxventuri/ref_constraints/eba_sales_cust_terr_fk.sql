alter table xxventuri.eba_sales_customers
    add constraint eba_sales_cust_terr_fk
        foreign key ( customer_territory_id )
            references xxventuri.eba_sales_territories ( id )
        enable;


-- sqlcl_snapshot {"hash":"1bfdee7eee35f36315cdbe534a52d6e7fe354d20","type":"REF_CONSTRAINT","name":"EBA_SALES_CUST_TERR_FK","schemaName":"XXVENTURI","sxml":""}