create index xxventuri.eba_sales_act_competition_3 on
    xxventuri.eba_sales_act_competition (
        competitor_threat_id
    );


-- sqlcl_snapshot {"hash":"e1c3cb8788d1eb8464973613dfd2eafdde080fd4","type":"INDEX","name":"EBA_SALES_ACT_COMPETITION_3","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_ACT_COMPETITION_3</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_ACT_COMPETITION</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>COMPETITOR_THREAT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}