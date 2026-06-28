create index xxventuri.eba_sales_deal_competition_i2 on
    xxventuri.eba_sales_deal_competition (
        deal_id
    );


-- sqlcl_snapshot {"hash":"38e63d583798524dbbced5e91bb8ec7267501604","type":"INDEX","name":"EBA_SALES_DEAL_COMPETITION_I2","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEAL_COMPETITION_I2</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEAL_COMPETITION</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>DEAL_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}