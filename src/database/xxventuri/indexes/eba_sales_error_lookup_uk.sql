create unique index xxventuri.eba_sales_error_lookup_uk on
    xxventuri.eba_sales_error_lookup (
        constraint_name,
        language_code
    );


-- sqlcl_snapshot {"hash":"8140ee602145266ab719127d9413bdf53621862b","type":"INDEX","name":"EBA_SALES_ERROR_LOOKUP_UK","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_ERROR_LOOKUP_UK</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_ERROR_LOOKUP</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>CONSTRAINT_NAME</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>LANGUAGE_CODE</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}