create index xxventuri.eba_sales_links_idx3 on
    xxventuri.eba_sales_links (
        territory_id
    );


-- sqlcl_snapshot {"hash":"e8f8f1e8f7ea8be67d1ee1a47f64277a65b8a53c","type":"INDEX","name":"EBA_SALES_LINKS_IDX3","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_LINKS_IDX3</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_LINKS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>TERRITORY_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}