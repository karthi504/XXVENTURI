create index xxventuri.crm_leads_status_idx on
    xxventuri.crm_leads_t (
        lead_status
    );


-- sqlcl_snapshot {"hash":"a62f1c912d7b8e9b538fac07d51e2140672fff9a","type":"INDEX","name":"CRM_LEADS_STATUS_IDX","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>CRM_LEADS_STATUS_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>CRM_LEADS_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>LEAD_STATUS</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}