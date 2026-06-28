alter table xxventuri.eba_sales_customer_locations
    add constraint eba_sales_customer_loc_fk
        foreign key ( customer_id )
            references xxventuri.eba_sales_customers ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"944d0ddc7588d1ab23a7f1c0122f937390cff42b","type":"REF_CONSTRAINT","name":"EBA_SALES_CUSTOMER_LOC_FK","schemaName":"XXVENTURI","sxml":""}