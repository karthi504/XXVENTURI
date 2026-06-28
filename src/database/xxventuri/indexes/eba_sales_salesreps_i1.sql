create index xxventuri.eba_sales_salesreps_i1 on
    xxventuri.eba_sales_salesreps (
        rep_email
    );


-- sqlcl_snapshot {"hash":"485927dc909dfa1cc7a4352f58f8392012fae654","type":"INDEX","name":"EBA_SALES_SALESREPS_I1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_SALESREPS_I1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_SALESREPS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>REP_EMAIL</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}