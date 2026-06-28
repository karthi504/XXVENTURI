create index xxventuri.crm_contacts_status_idx on
    xxventuri.crm_contacts_t (
        status_code
    );


-- sqlcl_snapshot {"hash":"0d1d9efd9fccc233fa327bba07fc57d0de883f7b","type":"INDEX","name":"CRM_CONTACTS_STATUS_IDX","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>CRM_CONTACTS_STATUS_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>CRM_CONTACTS_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>STATUS_CODE</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}