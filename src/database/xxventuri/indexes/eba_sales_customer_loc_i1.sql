create index xxventuri.eba_sales_customer_loc_i1 on
    xxventuri.eba_sales_customer_locations (
        customer_id
    );


-- sqlcl_snapshot {"hash":"e37ec6eeb7b6bb1e4dfb6823e5a7623ff23ce119","type":"INDEX","name":"EBA_SALES_CUSTOMER_LOC_I1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_CUSTOMER_LOC_I1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_CUSTOMER_LOCATIONS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>CUSTOMER_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}