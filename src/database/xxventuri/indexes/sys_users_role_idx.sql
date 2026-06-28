create index xxventuri.sys_users_role_idx on
    xxventuri.sys_users_t (
        role_id
    );


-- sqlcl_snapshot {"hash":"ffc0f7dd25ca5b8976fa64da06e292c58efe568b","type":"INDEX","name":"SYS_USERS_ROLE_IDX","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>SYS_USERS_ROLE_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>SYS_USERS_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ROLE_ID</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}