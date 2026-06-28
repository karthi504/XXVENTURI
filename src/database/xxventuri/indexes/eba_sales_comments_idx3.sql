create index xxventuri.eba_sales_comments_idx3 on
    xxventuri.eba_sales_comments (
        territory_id
    );


-- sqlcl_snapshot {"hash":"76f743146e2923b036453254be6e86aa8aeb9f2b","type":"INDEX","name":"EBA_SALES_COMMENTS_IDX3","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_COMMENTS_IDX3</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_COMMENTS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>TERRITORY_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}