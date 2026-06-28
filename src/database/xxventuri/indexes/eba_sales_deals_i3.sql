create index xxventuri.eba_sales_deals_i3 on
    xxventuri.eba_sales_deals (
        salesrep_id_03
    );


-- sqlcl_snapshot {"hash":"6c59a29a1339ea241cb4059d547bbf4cf014733f","type":"INDEX","name":"EBA_SALES_DEALS_I3","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEALS_I3</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEALS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>SALESREP_ID_03</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}