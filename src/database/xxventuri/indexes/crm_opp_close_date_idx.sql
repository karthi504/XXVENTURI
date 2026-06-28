create index xxventuri.crm_opp_close_date_idx on
    xxventuri.crm_opportunities_t (
        expected_close_date
    );


-- sqlcl_snapshot {"hash":"91bd98702b55b7d8154cef693cdb9e867e075ebe","type":"INDEX","name":"CRM_OPP_CLOSE_DATE_IDX","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>CRM_OPP_CLOSE_DATE_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>CRM_OPPORTUNITIES_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>EXPECTED_CLOSE_DATE</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}