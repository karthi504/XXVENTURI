create index xxventuri.xxeba_sales_order_n4 on
    xxventuri.xxeba_sales_order (
        deal_id
    );


-- sqlcl_snapshot {"hash":"454a62f43a8ae31956677076f4b7f78f1530bd4c","type":"INDEX","name":"XXEBA_SALES_ORDER_N4","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>XXEBA_SALES_ORDER_N4</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>XXEBA_SALES_ORDER</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>DEAL_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}