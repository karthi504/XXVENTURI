create index xxventuri.crm_leads_source_idx on
    xxventuri.crm_leads_t (
        lead_source
    );


-- sqlcl_snapshot {"hash":"c20d893836cd5dd50993d649382f0cc7ea1efa20","type":"INDEX","name":"CRM_LEADS_SOURCE_IDX","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>CRM_LEADS_SOURCE_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>CRM_LEADS_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>LEAD_SOURCE</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}