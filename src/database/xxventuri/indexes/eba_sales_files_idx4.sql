create index xxventuri.eba_sales_files_idx4 on
    xxventuri.eba_sales_files (
        account_id
    );


-- sqlcl_snapshot {"hash":"b3da07f120b8149daaed14b3a2d4285cc7269c61","type":"INDEX","name":"EBA_SALES_FILES_IDX4","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_FILES_IDX4</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_FILES</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ACCOUNT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}