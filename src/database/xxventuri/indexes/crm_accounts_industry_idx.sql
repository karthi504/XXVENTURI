create index xxventuri.crm_accounts_industry_idx on
    xxventuri.crm_accounts_t (
        industry
    );


-- sqlcl_snapshot {"hash":"550f3b39bbd0edf984f06896a7edf21769aec985","type":"INDEX","name":"CRM_ACCOUNTS_INDUSTRY_IDX","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>CRM_ACCOUNTS_INDUSTRY_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>CRM_ACCOUNTS_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>INDUSTRY</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}