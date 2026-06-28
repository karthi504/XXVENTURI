create index xxventuri.eba_sales_sales_per_i1 on
    xxventuri.eba_sales_sales_periods (
        period_name
    );


-- sqlcl_snapshot {"hash":"1ef85c600e0673792538e092a3b3583d62620b0b","type":"INDEX","name":"EBA_SALES_SALES_PER_I1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_SALES_PER_I1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_SALES_PERIODS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>PERIOD_NAME</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}