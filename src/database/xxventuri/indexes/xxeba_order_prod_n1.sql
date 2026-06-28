create index xxventuri.xxeba_order_prod_n1 on
    xxventuri.xxeba_order_products (
        order_id
    );


-- sqlcl_snapshot {"hash":"55df2cfeb1215ae4c74e8a2b7a9289238a65ca70","type":"INDEX","name":"XXEBA_ORDER_PROD_N1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>XXEBA_ORDER_PROD_N1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>XXEBA_ORDER_PRODUCTS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ORDER_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}