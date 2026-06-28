create table xxventuri.xxeba_sales_kit_files (
    kit_id           number,
    file_title       varchar2(400 byte),
    file_type_id     number,
    file_images      blob,
    file_name        varchar2(600 byte),
    file_mimetype    varchar2(600 byte),
    file_charset     varchar2(600 byte),
    file_last_update date,
    file_comments    varchar2(600 byte),
    created_by       varchar2(240 byte),
    created_date     date,
    updated_by       varchar2(240 byte),
    updated_date     date,
    status           varchar2(10 byte),
    rep_id           number
);

alter table xxventuri.xxeba_sales_kit_files
    add constraint kit_id_pk primary key ( kit_id )
        using index enable;


-- sqlcl_snapshot {"hash":"187a6823561e214c2783b393a3b954d07da8a588","type":"TABLE","name":"XXEBA_SALES_KIT_FILES","schemaName":"XXVENTURI","sxml":"\n  <TABLE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>XXEBA_SALES_KIT_FILES</NAME>\n   <RELATIONAL_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>KIT_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FILE_TITLE</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>400</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FILE_TYPE_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FILE_IMAGES</NAME>\n            <DATATYPE>BLOB</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FILE_NAME</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>600</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FILE_MIMETYPE</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>600</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FILE_CHARSET</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>600</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FILE_LAST_UPDATE</NAME>\n            <DATATYPE>DATE</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FILE_COMMENTS</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>600</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>240</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED_DATE</NAME>\n            <DATATYPE>DATE</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>240</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATED_DATE</NAME>\n            <DATATYPE>DATE</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>STATUS</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>10</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>REP_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <PRIMARY_KEY_CONSTRAINT_LIST>\n         <PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n            <NAME>KIT_ID_PK</NAME>\n            <COL_LIST>\n               <COL_LIST_ITEM>\n                  <NAME>KIT_ID</NAME>\n               </COL_LIST_ITEM>\n            </COL_LIST>\n            <USING_INDEX></USING_INDEX>\n         </PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n      </PRIMARY_KEY_CONSTRAINT_LIST>\n      <DEFAULT_COLLATION>USING_NLS_COMP</DEFAULT_COLLATION>\n      <PHYSICAL_PROPERTIES>\n         <HEAP_TABLE></HEAP_TABLE>\n      </PHYSICAL_PROPERTIES>\n      \n   </RELATIONAL_TABLE>\n</TABLE>"}