create index xxventuri.eba_sales_deals_i9 on
    xxventuri.eba_sales_deals (
        vp_id
    );


-- sqlcl_snapshot {"hash":"74076b08ce450cddc441b8a659356f5f04e3403f","type":"INDEX","name":"EBA_SALES_DEALS_I9","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_DEALS_I9</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_DEALS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>VP_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}