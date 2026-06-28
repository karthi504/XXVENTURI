create index xxventuri.eba_sales_comments_idx1 on
    xxventuri.eba_sales_comments (
        deal_id
    );


-- sqlcl_snapshot {"hash":"32b670a359c85ec6cb9843f87b18bca9c0c0d1dc","type":"INDEX","name":"EBA_SALES_COMMENTS_IDX1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_COMMENTS_IDX1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_COMMENTS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>DEAL_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}