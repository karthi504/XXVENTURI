create index xxventuri.eba_sales_deals_i11 on
    xxventuri.eba_sales_deals (
        territory_id_old
    );


-- sqlcl_snapshot {"hash":"0751c51d5c8c3da9bcdd4ce284785be89e76da04","type":"INDEX","name":"EBA_SALES_DEALS_I11","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEALS_I11</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEALS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>TERRITORY_ID_OLD</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}