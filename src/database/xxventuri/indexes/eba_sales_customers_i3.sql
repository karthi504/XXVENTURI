create index xxventuri.eba_sales_customers_i3 on
    xxventuri.eba_sales_customers (
        customer_territory_id
    );


-- sqlcl_snapshot {"hash":"a64b7b1b92efa910f1dde24713d49fd69e0c69ed","type":"INDEX","name":"EBA_SALES_CUSTOMERS_I3","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_CUSTOMERS_I3</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_CUSTOMERS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>CUSTOMER_TERRITORY_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}