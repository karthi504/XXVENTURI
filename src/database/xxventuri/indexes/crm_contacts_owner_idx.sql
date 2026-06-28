create index xxventuri.crm_contacts_owner_idx on
    xxventuri.crm_contacts_t (
        owner_id
    );


-- sqlcl_snapshot {"hash":"19c34446ce10fdda8993223c1c946ac149df9ed1","type":"INDEX","name":"CRM_CONTACTS_OWNER_IDX","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>CRM_CONTACTS_OWNER_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>CRM_CONTACTS_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>OWNER_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}