create index xxventuri.eba_sales_comments_idx4 on
    xxventuri.eba_sales_comments (
        account_id
    );


-- sqlcl_snapshot {"hash":"7ef3b475793acbd41ab7f0c54eb247df1f1a9957","type":"INDEX","name":"EBA_SALES_COMMENTS_IDX4","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_COMMENTS_IDX4</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_COMMENTS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ACCOUNT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}