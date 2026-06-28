create index xxventuri.crm_accounts_status_idx on
    xxventuri.crm_accounts_t (
        status_code
    );


-- sqlcl_snapshot {"hash":"81c55edc0160e66cd0879f5eb6bc314aa037f3c7","type":"INDEX","name":"CRM_ACCOUNTS_STATUS_IDX","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>CRM_ACCOUNTS_STATUS_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>CRM_ACCOUNTS_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>STATUS_CODE</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}