create index xxventuri.crm_opp_contact_idx on
    xxventuri.crm_opportunities_t (
        contact_id
    );


-- sqlcl_snapshot {"hash":"834fd71fafefb3792706e100445be4edf3e65cd4","type":"INDEX","name":"CRM_OPP_CONTACT_IDX","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>CRM_OPP_CONTACT_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>CRM_OPPORTUNITIES_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>CONTACT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}