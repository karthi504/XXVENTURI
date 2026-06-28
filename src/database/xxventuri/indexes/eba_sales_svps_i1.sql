create unique index xxventuri.eba_sales_svps_i1 on
    xxventuri.eba_sales_svps (
        svp_name
    );


-- sqlcl_snapshot {"hash":"913d1ea659c12a38065e16a716496b71e5beec0a","type":"INDEX","name":"EBA_SALES_SVPS_I1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_SVPS_I1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_SVPS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>SVP_NAME</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}