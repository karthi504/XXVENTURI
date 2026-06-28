create unique index xxventuri.eba_sales_access_levels_uk on
    xxventuri.eba_sales_access_levels (
        access_level
    );


-- sqlcl_snapshot {"hash":"30c4514df8ba87aa330e5d62957735ce6f6cf1fe","type":"INDEX","name":"EBA_SALES_ACCESS_LEVELS_UK","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_ACCESS_LEVELS_UK</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_ACCESS_LEVELS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ACCESS_LEVEL</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}