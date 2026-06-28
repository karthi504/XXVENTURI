create index xxventuri.eba_sales_errors_i1 on
    xxventuri.eba_sales_errors (
        err_time
    );


-- sqlcl_snapshot {"hash":"b3ddf7266ba5f624cf79ba1c42fdfebde7236e63","type":"INDEX","name":"EBA_SALES_ERRORS_I1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_ERRORS_I1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_ERRORS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ERR_TIME</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}