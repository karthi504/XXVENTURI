create index xxventuri.eba_sales_deals_i7 on
    xxventuri.eba_sales_deals (
        risk_assessment_id
    );


-- sqlcl_snapshot {"hash":"27b11c5aae8c433273c56854973867b88089d6b5","type":"INDEX","name":"EBA_SALES_DEALS_I7","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEALS_I7</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEALS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>RISK_ASSESSMENT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}