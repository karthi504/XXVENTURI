create index xxventuri.eba_sales_terr_map_i4 on
    xxventuri.eba_sales_terr_map (
        country_id
    );


-- sqlcl_snapshot {"hash":"d0bb16c2074bf89b8f05e2f4cea7ee34691c1d12","type":"INDEX","name":"EBA_SALES_TERR_MAP_I4","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_TERR_MAP_I4</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_TERR_MAP</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>COUNTRY_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}