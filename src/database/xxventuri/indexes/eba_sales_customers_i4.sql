create index xxventuri.eba_sales_customers_i4 on
    xxventuri.eba_sales_customers (
        customer_name
    );


-- sqlcl_snapshot {"hash":"d0cfe0234b2d2df39e2c6c1da575512a4d72cc25","type":"INDEX","name":"EBA_SALES_CUSTOMERS_I4","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_CUSTOMERS_I4</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_CUSTOMERS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>CUSTOMER_NAME</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}