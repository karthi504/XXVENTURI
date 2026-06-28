create index xxventuri.crm_accounts_owner_idx on
    xxventuri.crm_accounts_t (
        owner_id
    );


-- sqlcl_snapshot {"hash":"515eaf53e8af66a1313cbd1d9abc227aa0d1e960","type":"INDEX","name":"CRM_ACCOUNTS_OWNER_IDX","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>CRM_ACCOUNTS_OWNER_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>CRM_ACCOUNTS_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>OWNER_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}