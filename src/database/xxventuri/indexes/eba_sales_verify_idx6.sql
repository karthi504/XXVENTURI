create index xxventuri.eba_sales_verify_idx6 on
    xxventuri.eba_sales_verifications (
        product_id
    );


-- sqlcl_snapshot {"hash":"7485ad46830c7e26de0f7f481f75da536a063bc6","type":"INDEX","name":"EBA_SALES_VERIFY_IDX6","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_VERIFY_IDX6</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_VERIFICATIONS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>PRODUCT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}