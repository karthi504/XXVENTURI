create index xxventuri.eba_sales_clicks_idx1 on
    xxventuri.eba_sales_clicks (
        lead_id
    );


-- sqlcl_snapshot {"hash":"86291f4c4265e921b48a6071c7d16466a6bf305d","type":"INDEX","name":"EBA_SALES_CLICKS_IDX1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_CLICKS_IDX1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_CLICKS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>LEAD_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}