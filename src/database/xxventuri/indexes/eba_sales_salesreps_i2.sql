create index xxventuri.eba_sales_salesreps_i2 on
    xxventuri.eba_sales_salesreps (
        rep_manager_id
    );


-- sqlcl_snapshot {"hash":"53d5817516e8ba2d1fcea6b0e8c7e9ba9d81bf27","type":"INDEX","name":"EBA_SALES_SALESREPS_I2","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_SALESREPS_I2</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_SALESREPS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>REP_MANAGER_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}