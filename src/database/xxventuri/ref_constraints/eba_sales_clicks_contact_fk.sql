alter table xxventuri.eba_sales_clicks
    add constraint eba_sales_clicks_contact_fk
        foreign key ( contact_id )
            references xxventuri.eba_sales_customer_contacts ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"cafd67100ecd2fdca6e771cb63d9c0ca81b5988f","type":"REF_CONSTRAINT","name":"EBA_SALES_CLICKS_CONTACT_FK","schemaName":"XXVENTURI","sxml":""}