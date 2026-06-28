create index xxventuri.crm_leads_company_idx on
    xxventuri.crm_leads_t (
        company
    );


-- sqlcl_snapshot {"hash":"103904a59b22172af7df53482a4a757052b186d1","type":"INDEX","name":"CRM_LEADS_COMPANY_IDX","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>CRM_LEADS_COMPANY_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>CRM_LEADS_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>COMPANY</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}