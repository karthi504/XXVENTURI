alter table xxventuri.eba_sales_act_competition
    add constraint eba_sales_act_comp_fk3
        foreign key ( competitor_threat_id )
            references xxventuri.eba_sales_competitor_threats ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"f1a274278817c3a602b630b41da00abde44a84de","type":"REF_CONSTRAINT","name":"EBA_SALES_ACT_COMP_FK3","schemaName":"XXVENTURI","sxml":""}