create unique index xxventuri.eba_sales_deal_statcod_i1 on
    xxventuri.eba_sales_deal_status_codes (
        status_code
    );


-- sqlcl_snapshot {"hash":"ace34ceed018a2ea60c4d46cf3a8130e01245d2e","type":"INDEX","name":"EBA_SALES_DEAL_STATCOD_I1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEAL_STATCOD_I1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEAL_STATUS_CODES</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>STATUS_CODE</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}