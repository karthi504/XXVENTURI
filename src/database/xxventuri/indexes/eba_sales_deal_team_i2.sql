create index xxventuri.eba_sales_deal_team_i2 on
    xxventuri.eba_sales_deal_team (
        rep_id
    );


-- sqlcl_snapshot {"hash":"0767f90d300808ded2fc67d3990873d4f2ba0073","type":"INDEX","name":"EBA_SALES_DEAL_TEAM_I2","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEAL_TEAM_I2</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEAL_TEAM</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>REP_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}