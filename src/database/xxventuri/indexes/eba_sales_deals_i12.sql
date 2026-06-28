create index xxventuri.eba_sales_deals_i12 on
    xxventuri.eba_sales_deals (
        external_opportunity_id
    );


-- sqlcl_snapshot {"hash":"10a3c798993c72df3d6882594f1c9eae5760ce67","type":"INDEX","name":"EBA_SALES_DEALS_I12","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEALS_I12</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEALS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>EXTERNAL_OPPORTUNITY_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}