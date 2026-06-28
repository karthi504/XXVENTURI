create unique index xxventuri.eba_sales_preferences_uk on
    xxventuri.eba_sales_preferences (
        preference_name
    );


-- sqlcl_snapshot {"hash":"06d5f03b88451d31fe53b545e156b09903c069a0","type":"INDEX","name":"EBA_SALES_PREFERENCES_UK","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_PREFERENCES_UK</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_PREFERENCES</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>PREFERENCE_NAME</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}