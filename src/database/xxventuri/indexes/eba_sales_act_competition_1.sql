create index xxventuri.eba_sales_act_competition_1 on
    xxventuri.eba_sales_act_competition (
        competitor_id
    );


-- sqlcl_snapshot {"hash":"84e8c207240b2d5c36be3489273d975c6e96cf1a","type":"INDEX","name":"EBA_SALES_ACT_COMPETITION_1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_ACT_COMPETITION_1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_ACT_COMPETITION</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>COMPETITOR_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}