create index xxventuri.eba_sales_deal_competition_i3 on
    xxventuri.eba_sales_deal_competition (
        competitor_threat_id
    );


-- sqlcl_snapshot {"hash":"a4ed4b49aab9153c12685cacf80cca4109321727","type":"INDEX","name":"EBA_SALES_DEAL_COMPETITION_I3","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEAL_COMPETITION_I3</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEAL_COMPETITION</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>COMPETITOR_THREAT_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}