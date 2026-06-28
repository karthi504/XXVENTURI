create index xxventuri.eba_sales_verify_idx3 on
    xxventuri.eba_sales_verifications (
        opp_id
    );


-- sqlcl_snapshot {"hash":"06384e8b3439fc85b29555ba87ad46a2473539e9","type":"INDEX","name":"EBA_SALES_VERIFY_IDX3","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_VERIFY_IDX3</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_VERIFICATIONS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>OPP_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}