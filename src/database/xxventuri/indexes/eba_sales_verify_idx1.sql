create index xxventuri.eba_sales_verify_idx1 on
    xxventuri.eba_sales_verifications (
        cust_id
    );


-- sqlcl_snapshot {"hash":"cd64840b6311ca731a7fa64eb2b1ade2d4a08df0","type":"INDEX","name":"EBA_SALES_VERIFY_IDX1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_VERIFY_IDX1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_VERIFICATIONS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>CUST_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}