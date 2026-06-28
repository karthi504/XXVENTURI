create index xxventuri.eba_sales_files_idx2 on
    xxventuri.eba_sales_files (
        lead_id
    );


-- sqlcl_snapshot {"hash":"1b9c3f51b9e834856528e09622845f47693100ba","type":"INDEX","name":"EBA_SALES_FILES_IDX2","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_FILES_IDX2</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_FILES</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>LEAD_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}