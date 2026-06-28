create table xxventuri.eba_sales_access_levels (
    id           number not null enable,
    access_level varchar2(30 byte) not null enable,
    row_version  number
);

alter table xxventuri.eba_sales_access_levels
    add constraint eba_sales_access_levels_ck
        check ( access_level in ( 'Administrator', 'Contributor', 'Reader', 'Approval Pending', 'No Access' ) ) enable;

alter table xxventuri.eba_sales_access_levels
    add constraint eba_sales_access_levels_pk primary key ( id )
        using index enable;


-- sqlcl_snapshot {"hash":"f054e20012c2f35a3c0fa88ba67495a812874843","type":"TABLE","name":"EBA_SALES_ACCESS_LEVELS","schemaName":"XXVENTURI","sxml":"\n  <TABLE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_ACCESS_LEVELS</NAME>\n   <RELATIONAL_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ACCESS_LEVEL</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>30</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ROW_VERSION</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <CHECK_CONSTRAINT_LIST>\n         <CHECK_CONSTRAINT_LIST_ITEM>\n            <NAME>EBA_SALES_ACCESS_LEVELS_CK</NAME>\n            <CONDITION>access_level in ( 'Administrator', 'Contributor', 'Reader', 'Approval Pending', 'No Access' )</CONDITION>\n         </CHECK_CONSTRAINT_LIST_ITEM>\n      </CHECK_CONSTRAINT_LIST>\n      <PRIMARY_KEY_CONSTRAINT_LIST>\n         <PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n            <NAME>EBA_SALES_ACCESS_LEVELS_PK</NAME>\n            <COL_LIST>\n               <COL_LIST_ITEM>\n                  <NAME>ID</NAME>\n               </COL_LIST_ITEM>\n            </COL_LIST>\n            <USING_INDEX></USING_INDEX>\n         </PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n      </PRIMARY_KEY_CONSTRAINT_LIST>\n      <DEFAULT_COLLATION>USING_NLS_COMP</DEFAULT_COLLATION>\n      <PHYSICAL_PROPERTIES>\n         <HEAP_TABLE></HEAP_TABLE>\n      </PHYSICAL_PROPERTIES>\n      \n   </RELATIONAL_TABLE>\n</TABLE>"}