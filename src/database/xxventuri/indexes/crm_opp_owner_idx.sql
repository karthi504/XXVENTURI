create index xxventuri.crm_opp_owner_idx on
    xxventuri.crm_opportunities_t (
        owner_id
    );


-- sqlcl_snapshot {"hash":"0f61832fc129374bd19b138e5d85cf25df804f1e","type":"INDEX","name":"CRM_OPP_OWNER_IDX","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>CRM_OPP_OWNER_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>CRM_OPPORTUNITIES_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>OWNER_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}