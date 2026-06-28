create index xxventuri.eba_sales_comments_idx2 on
    xxventuri.eba_sales_comments (
        lead_id
    );


-- sqlcl_snapshot {"hash":"ca07ea0c7636cb6b2f66c8819bfde0c9641b2071","type":"INDEX","name":"EBA_SALES_COMMENTS_IDX2","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_COMMENTS_IDX2</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_COMMENTS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>LEAD_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}