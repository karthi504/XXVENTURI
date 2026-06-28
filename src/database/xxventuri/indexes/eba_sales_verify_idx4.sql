create index xxventuri.eba_sales_verify_idx4 on
    xxventuri.eba_sales_verifications (
        territory_id
    );


-- sqlcl_snapshot {"hash":"58bf31c4f0936a9b82b6e1ba6fa5a7193d99caf8","type":"INDEX","name":"EBA_SALES_VERIFY_IDX4","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_VERIFY_IDX4</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_VERIFICATIONS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>TERRITORY_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}