create index xxventuri.crm_opp_account_idx on
    xxventuri.crm_opportunities_t (
        account_id
    );


-- sqlcl_snapshot {"hash":"bf38acad6fa31fa705b71d27b50de310a15e2454","type":"INDEX","name":"CRM_OPP_ACCOUNT_IDX","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>CRM_OPP_ACCOUNT_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>CRM_OPPORTUNITIES_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ACCOUNT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}