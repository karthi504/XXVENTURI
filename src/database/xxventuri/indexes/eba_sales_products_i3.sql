create index xxventuri.eba_sales_products_i3 on
    xxventuri.eba_sales_products (
        row_key
    );


-- sqlcl_snapshot {"hash":"65e4cc514ea6d75e256c96a51ac255c9ade8fe88","type":"INDEX","name":"EBA_SALES_PRODUCTS_I3","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_PRODUCTS_I3</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_PRODUCTS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ROW_KEY</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}