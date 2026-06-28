create index xxventuri.eba_sales_deals_i6 on
    xxventuri.eba_sales_deals (
        status_assessment_id
    );


-- sqlcl_snapshot {"hash":"e7eae7c37f0a1063546e0030fafed8951d03c2c4","type":"INDEX","name":"EBA_SALES_DEALS_I6","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEALS_I6</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEALS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>STATUS_ASSESSMENT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}