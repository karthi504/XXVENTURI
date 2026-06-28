create index xxventuri.crm_leads_owner_idx on
    xxventuri.crm_leads_t (
        owner_id
    );


-- sqlcl_snapshot {"hash":"dff44374767e32eb4615538a489ce43a3ea69dfa","type":"INDEX","name":"CRM_LEADS_OWNER_IDX","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>CRM_LEADS_OWNER_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>CRM_LEADS_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>OWNER_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}