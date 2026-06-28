create index xxventuri.eba_sales_terr_map_i1 on
    xxventuri.eba_sales_terr_map (
        territory_id
    );


-- sqlcl_snapshot {"hash":"c79c87f7ddd02e502460b869bb0b992cef62e54f","type":"INDEX","name":"EBA_SALES_TERR_MAP_I1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_TERR_MAP_I1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_TERR_MAP</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>TERRITORY_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}