create unique index xxventuri.xxeba_sales_order_n1 on
    xxventuri.xxeba_sales_order (
        order_id
    );


-- sqlcl_snapshot {"hash":"aa0cd0e797a5b95964b07db8ff1603326133302e","type":"INDEX","name":"XXEBA_SALES_ORDER_N1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>XXEBA_SALES_ORDER_N1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>XXEBA_SALES_ORDER</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ORDER_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}