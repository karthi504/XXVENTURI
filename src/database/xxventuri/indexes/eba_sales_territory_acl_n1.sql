create index xxventuri.eba_sales_territory_acl_n1 on
    xxventuri.eba_sales_territory_acl (
        territory_id
    );


-- sqlcl_snapshot {"hash":"fdc45fd85908d8642abbeb54d051dafcb6589031","type":"INDEX","name":"EBA_SALES_TERRITORY_ACL_N1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_TERRITORY_ACL_N1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_TERRITORY_ACL</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>TERRITORY_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}