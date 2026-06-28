create index xxventuri.xxeba_sales_order_n7 on
    xxventuri.xxeba_sales_order (
        delivery_location
    );


-- sqlcl_snapshot {"hash":"0fb98f620ee2966a538c02a1db5b217819617d17","type":"INDEX","name":"XXEBA_SALES_ORDER_N7","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>XXEBA_SALES_ORDER_N7</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>XXEBA_SALES_ORDER</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>DELIVERY_LOCATION</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}