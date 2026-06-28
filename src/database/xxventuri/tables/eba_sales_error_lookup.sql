create table xxventuri.eba_sales_error_lookup (
    constraint_name varchar2(30 byte) not null enable,
    message         varchar2(4000 byte) not null enable,
    language_code   varchar2(30 byte) not null enable
);

alter table xxventuri.eba_sales_error_lookup
    add constraint eba_sales_error_lookup_pk primary key ( constraint_name )
        using index enable;


-- sqlcl_snapshot {"hash":"58c4fb69afad61bc3de5c794def30d36898f2f9e","type":"TABLE","name":"EBA_SALES_ERROR_LOOKUP","schemaName":"XXVENTURI","sxml":"\n  <TABLE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_ERROR_LOOKUP</NAME>\n   <RELATIONAL_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>CONSTRAINT_NAME</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>30</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>MESSAGE</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>4000</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>LANGUAGE_CODE</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>30</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <PRIMARY_KEY_CONSTRAINT_LIST>\n         <PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n            <NAME>EBA_SALES_ERROR_LOOKUP_PK</NAME>\n            <COL_LIST>\n               <COL_LIST_ITEM>\n                  <NAME>CONSTRAINT_NAME</NAME>\n               </COL_LIST_ITEM>\n            </COL_LIST>\n            <USING_INDEX></USING_INDEX>\n         </PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n      </PRIMARY_KEY_CONSTRAINT_LIST>\n      <DEFAULT_COLLATION>USING_NLS_COMP</DEFAULT_COLLATION>\n      <PHYSICAL_PROPERTIES>\n         <HEAP_TABLE></HEAP_TABLE>\n      </PHYSICAL_PROPERTIES>\n      \n   </RELATIONAL_TABLE>\n</TABLE>"}