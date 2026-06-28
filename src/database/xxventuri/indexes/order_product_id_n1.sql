create index xxventuri.order_product_id_n1 on
    xxventuri.xxeba_order_products (
        order_products_id
    );


-- sqlcl_snapshot {"hash":"10f8a28caeb66025e674181a65bba57c1d596a33","type":"INDEX","name":"ORDER_PRODUCT_ID_N1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>ORDER_PRODUCT_ID_N1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>XXEBA_ORDER_PRODUCTS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ORDER_PRODUCTS_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}