create index xxventuri.eba_sales_deals_i8 on
    xxventuri.eba_sales_deals (
        account_standing_id
    );


-- sqlcl_snapshot {"hash":"cca2c2a9d5e1d0231f56bedd6012f1f7a7c0b06d","type":"INDEX","name":"EBA_SALES_DEALS_I8","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEALS_I8</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEALS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ACCOUNT_STANDING_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}