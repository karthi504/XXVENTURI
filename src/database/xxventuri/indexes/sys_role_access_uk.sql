create unique index xxventuri.sys_role_access_uk on
    xxventuri.sys_role_access_t (
        role_id,
        page_number
    );


-- sqlcl_snapshot {"hash":"eacc1fc5dba56b36c48774dcafce6f48f991e99e","type":"INDEX","name":"SYS_ROLE_ACCESS_UK","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>SYS_ROLE_ACCESS_UK</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>SYS_ROLE_ACCESS_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ROLE_ID</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>PAGE_NUMBER</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}