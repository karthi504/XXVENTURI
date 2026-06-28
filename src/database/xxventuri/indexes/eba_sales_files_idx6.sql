create index xxventuri.eba_sales_files_idx6 on
    xxventuri.eba_sales_files (
        product_id
    );


-- sqlcl_snapshot {"hash":"e7ffc91d04d8af2a6fc6db1c80b981917989c7e6","type":"INDEX","name":"EBA_SALES_FILES_IDX6","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_FILES_IDX6</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_FILES</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>PRODUCT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}