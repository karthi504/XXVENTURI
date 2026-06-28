alter table xxventuri.eba_sales_links
    add constraint eba_sales_links_leads_fk
        foreign key ( lead_id )
            references xxventuri.eba_sales_leads ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"754fbabe60b72181c7ac25ec0541dfa802de554d","type":"REF_CONSTRAINT","name":"EBA_SALES_LINKS_LEADS_FK","schemaName":"XXVENTURI","sxml":""}