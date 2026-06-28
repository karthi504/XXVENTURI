create table xxventuri.sharepoint_test (
    id               number,
    file_attach      blob,
    file_name        varchar2(600 byte),
    file_mimetype    varchar2(600 byte),
    file_charset     varchar2(600 byte),
    file_last_update date
);


-- sqlcl_snapshot {"hash":"4ff6ae7147a3a8cc9b68fed33affff3245134b5c","type":"TABLE","name":"SHAREPOINT_TEST","schemaName":"XXVENTURI","sxml":"\n  <TABLE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>SHAREPOINT_TEST</NAME>\n   <RELATIONAL_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FILE_ATTACH</NAME>\n            <DATATYPE>BLOB</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FILE_NAME</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>600</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FILE_MIMETYPE</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>600</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FILE_CHARSET</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>600</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FILE_LAST_UPDATE</NAME>\n            <DATATYPE>DATE</DATATYPE>\n            \n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <DEFAULT_COLLATION>USING_NLS_COMP</DEFAULT_COLLATION>\n      <PHYSICAL_PROPERTIES>\n         <HEAP_TABLE></HEAP_TABLE>\n      </PHYSICAL_PROPERTIES>\n      \n   </RELATIONAL_TABLE>\n</TABLE>"}