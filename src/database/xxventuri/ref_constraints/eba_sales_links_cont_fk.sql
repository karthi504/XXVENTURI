alter table xxventuri.eba_sales_links
    add constraint eba_sales_links_cont_fk
        foreign key ( contact_id )
            references xxventuri.eba_sales_customer_contacts ( id )
        enable;


-- sqlcl_snapshot {"hash":"03aed7f0e61ac6c1f1e36c43c5f40fd55e4b6b13","type":"REF_CONSTRAINT","name":"EBA_SALES_LINKS_CONT_FK","schemaName":"XXVENTURI","sxml":""}