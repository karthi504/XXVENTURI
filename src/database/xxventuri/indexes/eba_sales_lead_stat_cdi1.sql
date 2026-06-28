create unique index xxventuri.eba_sales_lead_stat_cdi1 on
    xxventuri.eba_sales_lead_status_codes (
        status_code
    );


-- sqlcl_snapshot {"hash":"6da2a1ca341a1bb5ac258d15a3959d9c254fc4c7","type":"INDEX","name":"EBA_SALES_LEAD_STAT_CDI1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_LEAD_STAT_CDI1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_LEAD_STATUS_CODES</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>STATUS_CODE</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}