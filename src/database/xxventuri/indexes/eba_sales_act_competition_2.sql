create index xxventuri.eba_sales_act_competition_2 on
    xxventuri.eba_sales_act_competition (
        customer_id
    );


-- sqlcl_snapshot {"hash":"f1b5ea0321babfd69d5450b70e284748b28fd88f","type":"INDEX","name":"EBA_SALES_ACT_COMPETITION_2","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_ACT_COMPETITION_2</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_ACT_COMPETITION</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>CUSTOMER_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}