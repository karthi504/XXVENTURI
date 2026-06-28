create index xxventuri.crm_accounts_type_idx on
    xxventuri.crm_accounts_t (
        account_type
    );


-- sqlcl_snapshot {"hash":"567abd9990fcd5ba94679a0cfd129cf8d1457b00","type":"INDEX","name":"CRM_ACCOUNTS_TYPE_IDX","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>CRM_ACCOUNTS_TYPE_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>CRM_ACCOUNTS_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ACCOUNT_TYPE</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}