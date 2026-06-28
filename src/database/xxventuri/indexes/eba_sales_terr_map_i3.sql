create index xxventuri.eba_sales_terr_map_i3 on
    xxventuri.eba_sales_terr_map (
        state_id
    );


-- sqlcl_snapshot {"hash":"e877205ef512da8fb11c2e2f59c4a1351410756c","type":"INDEX","name":"EBA_SALES_TERR_MAP_I3","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_TERR_MAP_I3</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_TERR_MAP</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>STATE_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}