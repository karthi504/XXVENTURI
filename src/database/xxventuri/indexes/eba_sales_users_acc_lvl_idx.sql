create index xxventuri.eba_sales_users_acc_lvl_idx on
    xxventuri.eba_sales_users (
        access_level_id
    );


-- sqlcl_snapshot {"hash":"2703c08817cd63857b2598ca4e57886bc3dc8469","type":"INDEX","name":"EBA_SALES_USERS_ACC_LVL_IDX","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_USERS_ACC_LVL_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_USERS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ACCESS_LEVEL_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}