create index xxventuri.eba_sales_deal_prod_i2 on
    xxventuri.eba_sales_deal_products (
        product_id
    );


-- sqlcl_snapshot {"hash":"698b86a4d9752852c2c3a60e9512b06f2ac52fff","type":"INDEX","name":"EBA_SALES_DEAL_PROD_I2","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEAL_PROD_I2</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEAL_PRODUCTS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>PRODUCT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}