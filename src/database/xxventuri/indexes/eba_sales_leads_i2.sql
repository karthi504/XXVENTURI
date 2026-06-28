create index xxventuri.eba_sales_leads_i2 on
    xxventuri.eba_sales_leads (
        lead_source_id
    );


-- sqlcl_snapshot {"hash":"1a2e56826342f96b92eba5aa04202aa2f4c461cf","type":"INDEX","name":"EBA_SALES_LEADS_I2","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_LEADS_I2</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_LEADS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>LEAD_SOURCE_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}