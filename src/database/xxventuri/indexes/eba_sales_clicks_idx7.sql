create index xxventuri.eba_sales_clicks_idx7 on
    xxventuri.eba_sales_clicks (
        product_id
    );


-- sqlcl_snapshot {"hash":"2c89db6179f93393d69de24338b203d4c8a257e8","type":"INDEX","name":"EBA_SALES_CLICKS_IDX7","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_CLICKS_IDX7</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_CLICKS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>PRODUCT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}