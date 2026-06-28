create index xxventuri.eba_sales_deal_competition_i1 on
    xxventuri.eba_sales_deal_competition (
        competitor_id
    );


-- sqlcl_snapshot {"hash":"b221acf9f4b8dfa772dcee992f68f084b044ea80","type":"INDEX","name":"EBA_SALES_DEAL_COMPETITION_I1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEAL_COMPETITION_I1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEAL_COMPETITION</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>COMPETITOR_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}