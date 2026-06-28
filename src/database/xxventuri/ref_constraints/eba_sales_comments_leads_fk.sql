alter table xxventuri.eba_sales_comments
    add constraint eba_sales_comments_leads_fk
        foreign key ( lead_id )
            references xxventuri.eba_sales_leads ( id )
                on delete cascade
        enable;


-- sqlcl_snapshot {"hash":"c68ddd0ace3ed898c809ba3681549139eef51b9c","type":"REF_CONSTRAINT","name":"EBA_SALES_COMMENTS_LEADS_FK","schemaName":"XXVENTURI","sxml":""}