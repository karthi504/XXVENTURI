create index xxventuri.eba_sales_verify_idx2 on
    xxventuri.eba_sales_verifications (
        lead_id
    );


-- sqlcl_snapshot {"hash":"cf46b795ee89f63ee042063ba4632055c66c45b5","type":"INDEX","name":"EBA_SALES_VERIFY_IDX2","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_VERIFY_IDX2</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_VERIFICATIONS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>LEAD_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}