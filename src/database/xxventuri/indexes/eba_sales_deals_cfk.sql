create index xxventuri.eba_sales_deals_cfk on
    xxventuri.eba_sales_deals (
        customer_id
    );


-- sqlcl_snapshot {"hash":"0aedd2155a402be18f993b76b97863eb2ace2909","type":"INDEX","name":"EBA_SALES_DEALS_CFK","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEALS_CFK</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEALS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>CUSTOMER_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}