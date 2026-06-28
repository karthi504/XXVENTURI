create index xxventuri.eba_sales_deal_team_i1 on
    xxventuri.eba_sales_deal_team (
        deal_id
    );


-- sqlcl_snapshot {"hash":"4fc77ed630f1ca17cce80d5bee21df2d2de8ac60","type":"INDEX","name":"EBA_SALES_DEAL_TEAM_I1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEAL_TEAM_I1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEAL_TEAM</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>DEAL_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}