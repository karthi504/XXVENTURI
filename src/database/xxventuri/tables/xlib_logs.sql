create table xxventuri.xlib_logs (
    log_id         number,
    log_module     varchar2(100 char),
    log_msg        varchar2(4000 char),
    log_type       varchar2(20 char) default 'DEBUG',
    log_level      number default 15,
    log_created_on date,
    log_created_by varchar2(100 char)
);

alter table xxventuri.xlib_logs
    add constraint xlib_logs_pk primary key ( log_id )
        using index enable;


-- sqlcl_snapshot {"hash":"71f060c3eef2bb1d02eff3827cf1dff8835470eb","type":"TABLE","name":"XLIB_LOGS","schemaName":"XXVENTURI","sxml":"\n  <TABLE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>XLIB_LOGS</NAME>\n   <RELATIONAL_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>LOG_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>LOG_MODULE</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>100</LENGTH>\n            <CHAR_SEMANTICS></CHAR_SEMANTICS>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>LOG_MSG</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>4000</LENGTH>\n            <CHAR_SEMANTICS></CHAR_SEMANTICS>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>LOG_TYPE</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>20</LENGTH>\n            <CHAR_SEMANTICS></CHAR_SEMANTICS>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <DEFAULT>'DEBUG'</DEFAULT>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>LOG_LEVEL</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            <DEFAULT>15</DEFAULT>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>LOG_CREATED_ON</NAME>\n            <DATATYPE>DATE</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>LOG_CREATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>100</LENGTH>\n            <CHAR_SEMANTICS></CHAR_SEMANTICS>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <PRIMARY_KEY_CONSTRAINT_LIST>\n         <PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n            <NAME>XLIB_LOGS_PK</NAME>\n            <COL_LIST>\n               <COL_LIST_ITEM>\n                  <NAME>LOG_ID</NAME>\n               </COL_LIST_ITEM>\n            </COL_LIST>\n            <USING_INDEX></USING_INDEX>\n         </PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n      </PRIMARY_KEY_CONSTRAINT_LIST>\n      <DEFAULT_COLLATION>USING_NLS_COMP</DEFAULT_COLLATION>\n      <PHYSICAL_PROPERTIES>\n         <HEAP_TABLE></HEAP_TABLE>\n      </PHYSICAL_PROPERTIES>\n      \n   </RELATIONAL_TABLE>\n</TABLE>"}