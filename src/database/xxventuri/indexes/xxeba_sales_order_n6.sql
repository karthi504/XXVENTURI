create index xxventuri.xxeba_sales_order_n6 on
    xxventuri.xxeba_sales_order (
        sales_rep
    );


-- sqlcl_snapshot {"hash":"677364d6add27c3788b00d7d95c8099437a99de3","type":"INDEX","name":"XXEBA_SALES_ORDER_N6","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>XXEBA_SALES_ORDER_N6</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>XXEBA_SALES_ORDER</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>SALES_REP</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}