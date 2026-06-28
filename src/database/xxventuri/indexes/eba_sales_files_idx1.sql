create index xxventuri.eba_sales_files_idx1 on
    xxventuri.eba_sales_files (
        deal_id
    );


-- sqlcl_snapshot {"hash":"a53cbb93074037f9889b91078c0400dc6230de57","type":"INDEX","name":"EBA_SALES_FILES_IDX1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_FILES_IDX1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_FILES</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>DEAL_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}