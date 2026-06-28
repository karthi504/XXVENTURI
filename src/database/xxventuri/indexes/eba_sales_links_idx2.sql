create index xxventuri.eba_sales_links_idx2 on
    xxventuri.eba_sales_links (
        lead_id
    );


-- sqlcl_snapshot {"hash":"cd21942b629facdabdc5f26225838eafe6bb5900","type":"INDEX","name":"EBA_SALES_LINKS_IDX2","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_LINKS_IDX2</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_LINKS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>LEAD_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}