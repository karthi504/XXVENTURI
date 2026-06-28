create index xxventuri.eba_sales_customers_i1 on
    xxventuri.eba_sales_customers (
        row_key
    );


-- sqlcl_snapshot {"hash":"d22e0753d3f4469655da37f8eb5ae014047f9ec1","type":"INDEX","name":"EBA_SALES_CUSTOMERS_I1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_CUSTOMERS_I1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_CUSTOMERS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ROW_KEY</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}