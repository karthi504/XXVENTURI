create index xxventuri.eba_sales_deal_prod_i1 on
    xxventuri.eba_sales_deal_products (
        deal_id
    );


-- sqlcl_snapshot {"hash":"94364aab2e59abf90fa6cf378afcacaad02ede9b","type":"INDEX","name":"EBA_SALES_DEAL_PROD_I1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEAL_PROD_I1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEAL_PRODUCTS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>DEAL_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}