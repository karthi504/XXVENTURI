alter table xxventuri.eba_sales_customers
    add constraint eba_sales_cust_reps_fk
        foreign key ( default_rep_id )
            references xxventuri.eba_sales_salesreps ( id )
                on delete set null
        enable;


-- sqlcl_snapshot {"hash":"261fa5cec55fea564a72d629541792787000ef9e","type":"REF_CONSTRAINT","name":"EBA_SALES_CUST_REPS_FK","schemaName":"XXVENTURI","sxml":""}