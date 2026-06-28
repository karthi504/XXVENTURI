create index xxventuri.eba_sales_links_idx4 on
    xxventuri.eba_sales_links (
        account_id
    );


-- sqlcl_snapshot {"hash":"70a6f8b12a51f19a1adfb8474b90b296fa8bff28","type":"INDEX","name":"EBA_SALES_LINKS_IDX4","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_LINKS_IDX4</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_LINKS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ACCOUNT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}