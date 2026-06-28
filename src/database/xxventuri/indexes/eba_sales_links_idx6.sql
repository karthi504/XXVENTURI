create index xxventuri.eba_sales_links_idx6 on
    xxventuri.eba_sales_links (
        product_id
    );


-- sqlcl_snapshot {"hash":"21caa6dbc18748b20c8f066d6e4b75d9441e5066","type":"INDEX","name":"EBA_SALES_LINKS_IDX6","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_LINKS_IDX6</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_LINKS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>PRODUCT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}