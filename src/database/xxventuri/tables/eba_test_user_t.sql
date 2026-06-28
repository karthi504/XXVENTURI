create table xxventuri.eba_test_user_t (
    testuser_id  number,
    name         varchar2(100 byte),
    email        varchar2(100 byte),
    status       char(1 byte),
    created_by   varchar2(255 byte),
    created_date timestamp(6),
    updated_by   varchar2(255 byte),
    updated_date timestamp(6)
);

alter table xxventuri.eba_test_user_t add primary key ( testuser_id )
    using index enable;


-- sqlcl_snapshot {"hash":"8aec68203f589bc66e4f52e2421d66801bab496d","type":"TABLE","name":"EBA_TEST_USER_T","schemaName":"XXVENTURI","sxml":"\n  <TABLE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_TEST_USER_T</NAME>\n   <RELATIONAL_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>TESTUSER_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>NAME</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>100</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>EMAIL</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>100</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>STATUS</NAME>\n            <DATATYPE>CHAR</DATATYPE>\n            <LENGTH>1</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>255</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED_DATE</NAME>\n            <DATATYPE>TIMESTAMP</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>255</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATED_DATE</NAME>\n            <DATATYPE>TIMESTAMP</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <PRIMARY_KEY_CONSTRAINT_LIST>\n         <PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n            <COL_LIST>\n               <COL_LIST_ITEM>\n                  <NAME>TESTUSER_ID</NAME>\n               </COL_LIST_ITEM>\n            </COL_LIST>\n            <USING_INDEX></USING_INDEX>\n         </PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n      </PRIMARY_KEY_CONSTRAINT_LIST>\n      <DEFAULT_COLLATION>USING_NLS_COMP</DEFAULT_COLLATION>\n      <PHYSICAL_PROPERTIES>\n         <HEAP_TABLE></HEAP_TABLE>\n      </PHYSICAL_PROPERTIES>\n      \n   </RELATIONAL_TABLE>\n</TABLE>"}