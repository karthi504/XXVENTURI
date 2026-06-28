alter table xxventuri.eba_sales_act_competition
    add constraint eba_sales_act_comp_fk2
        foreign key ( customer_id )
            references xxventuri.eba_sales_customers ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"c414854e4a6f102300a274fb4f01d1ec32e11d82","type":"REF_CONSTRAINT","name":"EBA_SALES_ACT_COMP_FK2","schemaName":"XXVENTURI","sxml":""}