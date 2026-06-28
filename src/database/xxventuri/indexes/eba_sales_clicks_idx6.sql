create index xxventuri.eba_sales_clicks_idx6 on
    xxventuri.eba_sales_clicks (
        contact_id
    );


-- sqlcl_snapshot {"hash":"4a8411e31f4d6c90b36dc49438ad7251f98012b3","type":"INDEX","name":"EBA_SALES_CLICKS_IDX6","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_CLICKS_IDX6</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_CLICKS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>CONTACT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}