create index xxventuri.eba_sales_customers_i5 on
    xxventuri.eba_sales_customers (
        default_rep_id
    );


-- sqlcl_snapshot {"hash":"1568f59095b736b98b51fa711b27582c80f29a37","type":"INDEX","name":"EBA_SALES_CUSTOMERS_I5","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_CUSTOMERS_I5</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_CUSTOMERS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>DEFAULT_REP_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}