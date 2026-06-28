create index xxventuri.eba_sales_deals_i2 on
    xxventuri.eba_sales_deals (
        salesrep_id_02
    );


-- sqlcl_snapshot {"hash":"dc5008caa6576c831a5e005f50e05f2ecfce9965","type":"INDEX","name":"EBA_SALES_DEALS_I2","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEALS_I2</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEALS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>SALESREP_ID_02</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}