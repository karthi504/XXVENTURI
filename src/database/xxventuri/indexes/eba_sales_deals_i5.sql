create index xxventuri.eba_sales_deals_i5 on
    xxventuri.eba_sales_deals (
        financial_assessment_id
    );


-- sqlcl_snapshot {"hash":"3f7c9d098048613fe0e1a9b0f9a2b3f9736e41a1","type":"INDEX","name":"EBA_SALES_DEALS_I5","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEALS_I5</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEALS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>FINANCIAL_ASSESSMENT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}