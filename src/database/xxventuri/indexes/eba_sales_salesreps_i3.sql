create index xxventuri.eba_sales_salesreps_i3 on
    xxventuri.eba_sales_salesreps (
        rep_eba_sales_username
    );


-- sqlcl_snapshot {"hash":"437e3d2a76ea9359d104fdd2e91a103a1f7a12f5","type":"INDEX","name":"EBA_SALES_SALESREPS_I3","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_SALESREPS_I3</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_SALESREPS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>REP_EBA_SALES_USERNAME</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}