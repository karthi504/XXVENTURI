create index xxventuri.eba_sales_salesreps_i4 on
    xxventuri.eba_sales_salesreps (
        svp_id
    );


-- sqlcl_snapshot {"hash":"6d94e3467fcb088c756517223a595cc729597389","type":"INDEX","name":"EBA_SALES_SALESREPS_I4","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_SALESREPS_I4</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_SALESREPS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>SVP_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}