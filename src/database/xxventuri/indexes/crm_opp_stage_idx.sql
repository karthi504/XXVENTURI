create index xxventuri.crm_opp_stage_idx on
    xxventuri.crm_opportunities_t (
        stage
    );


-- sqlcl_snapshot {"hash":"8a1f6a4e01b75cf4136315594184da9862ad202d","type":"INDEX","name":"CRM_OPP_STAGE_IDX","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>CRM_OPP_STAGE_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>CRM_OPPORTUNITIES_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>STAGE</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}