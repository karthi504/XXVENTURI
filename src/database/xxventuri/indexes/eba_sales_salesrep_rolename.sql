create unique index xxventuri.eba_sales_salesrep_rolename on
    xxventuri.eba_sales_salesrep_roles (
        role_name
    );


-- sqlcl_snapshot {"hash":"5ae2ef87d1e64925ab1a14f8fb6a0da2f9a35a47","type":"INDEX","name":"EBA_SALES_SALESREP_ROLENAME","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_SALESREP_ROLENAME</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_SALESREP_ROLES</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ROLE_NAME</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}