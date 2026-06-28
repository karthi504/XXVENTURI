create index xxventuri.eba_sales_comments_idx6 on
    xxventuri.eba_sales_comments (
        product_id
    );


-- sqlcl_snapshot {"hash":"4f9ff055ba597d7e4e542b877de8d24df60dacbe","type":"INDEX","name":"EBA_SALES_COMMENTS_IDX6","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_COMMENTS_IDX6</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_COMMENTS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>PRODUCT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}