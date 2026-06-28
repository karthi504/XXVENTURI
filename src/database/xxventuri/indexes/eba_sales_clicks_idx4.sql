create index xxventuri.eba_sales_clicks_idx4 on
    xxventuri.eba_sales_clicks (
        view_timestamp
    );


-- sqlcl_snapshot {"hash":"774734647e943c0aeda86d2817cca2d0a8a89104","type":"INDEX","name":"EBA_SALES_CLICKS_IDX4","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_CLICKS_IDX4</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_CLICKS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>VIEW_TIMESTAMP</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}