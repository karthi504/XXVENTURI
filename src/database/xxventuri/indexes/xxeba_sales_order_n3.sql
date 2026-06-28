create index xxventuri.xxeba_sales_order_n3 on
    xxventuri.xxeba_sales_order (
        billing_location
    );


-- sqlcl_snapshot {"hash":"797f5f03070f12b2393342e9260a68b73de835f7","type":"INDEX","name":"XXEBA_SALES_ORDER_N3","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>XXEBA_SALES_ORDER_N3</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>XXEBA_SALES_ORDER</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>BILLING_LOCATION</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}