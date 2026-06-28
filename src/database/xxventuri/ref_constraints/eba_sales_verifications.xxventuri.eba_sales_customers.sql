alter table xxventuri.eba_sales_verifications
    add
        foreign key ( cust_id )
            references xxventuri.eba_sales_customers ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"d5b48768b7b94f3410a181f9956824c745a3e2b3","type":"REF_CONSTRAINT","name":"EBA_SALES_VERIFICATIONS.XXVENTURI.EBA_SALES_CUSTOMERS","schemaName":"XXVENTURI","sxml":""}