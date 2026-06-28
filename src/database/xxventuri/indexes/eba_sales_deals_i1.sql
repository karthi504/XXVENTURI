create index xxventuri.eba_sales_deals_i1 on
    xxventuri.eba_sales_deals (
        salesrep_id_01
    );


-- sqlcl_snapshot {"hash":"64e3f17436b0054846a5cc93553ab5283ac10651","type":"INDEX","name":"EBA_SALES_DEALS_I1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEALS_I1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEALS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>SALESREP_ID_01</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}