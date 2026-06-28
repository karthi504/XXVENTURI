create table xxventuri.sys_role_access_t (
    access_id          number,
    role_id            number not null enable,
    page_number        number not null enable,
    create_access_flag char(1 byte) default 'N' not null enable,
    read_access_flag   char(1 byte) default 'Y' not null enable,
    update_access_flag char(1 byte) default 'N' not null enable,
    delete_access_flag char(1 byte) default 'N' not null enable,
    status_code        varchar2(20 char) default 'ACTIVE' not null enable,
    row_version        number default 0 not null enable,
    created_by         varchar2(100 char) not null enable,
    created_date       timestamp(6) not null enable,
    updated_by         varchar2(100 char) not null enable,
    updated_date       timestamp(6) not null enable
);

alter table xxventuri.sys_role_access_t
    add constraint sys_role_access_create_chk
        check ( create_access_flag in ( 'Y', 'N' ) ) enable;

alter table xxventuri.sys_role_access_t
    add constraint sys_role_access_delete_chk
        check ( delete_access_flag in ( 'Y', 'N' ) ) enable;

alter table xxventuri.sys_role_access_t
    add constraint sys_role_access_pk primary key ( access_id )
        using index enable;

alter table xxventuri.sys_role_access_t
    add constraint sys_role_access_read_chk
        check ( read_access_flag in ( 'Y', 'N' ) ) enable;

alter table xxventuri.sys_role_access_t
    add constraint sys_role_access_status_chk
        check ( status_code in ( 'ACTIVE', 'INACTIVE' ) ) enable;

alter table xxventuri.sys_role_access_t
    add constraint sys_role_access_update_chk
        check ( update_access_flag in ( 'Y', 'N' ) ) enable;


-- sqlcl_snapshot {"hash":"b47f52f5e12b20a30c0de7f3b9c91a8f92a3278b","type":"TABLE","name":"SYS_ROLE_ACCESS_T","schemaName":"XXVENTURI","sxml":"\n  <TABLE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>SYS_ROLE_ACCESS_T</NAME>\n   <RELATIONAL_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ACCESS_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ROLE_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>PAGE_NUMBER</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATE_ACCESS_FLAG</NAME>\n            <DATATYPE>CHAR</DATATYPE>\n            <LENGTH>1</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <DEFAULT>'N'</DEFAULT>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>READ_ACCESS_FLAG</NAME>\n            <DATATYPE>CHAR</DATATYPE>\n            <LENGTH>1</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <DEFAULT>'Y'</DEFAULT>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATE_ACCESS_FLAG</NAME>\n            <DATATYPE>CHAR</DATATYPE>\n            <LENGTH>1</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <DEFAULT>'N'</DEFAULT>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>DELETE_ACCESS_FLAG</NAME>\n            <DATATYPE>CHAR</DATATYPE>\n            <LENGTH>1</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <DEFAULT>'N'</DEFAULT>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>STATUS_CODE</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>20</LENGTH>\n            <CHAR_SEMANTICS></CHAR_SEMANTICS>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <DEFAULT>'ACTIVE'</DEFAULT>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ROW_VERSION</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            <DEFAULT>0</DEFAULT>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>100</LENGTH>\n            <CHAR_SEMANTICS></CHAR_SEMANTICS>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED_DATE</NAME>\n            <DATATYPE>TIMESTAMP</DATATYPE>\n            <SCALE>6</SCALE>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>100</LENGTH>\n            <CHAR_SEMANTICS></CHAR_SEMANTICS>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATED_DATE</NAME>\n            <DATATYPE>TIMESTAMP</DATATYPE>\n            <SCALE>6</SCALE>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <CHECK_CONSTRAINT_LIST>\n         <CHECK_CONSTRAINT_LIST_ITEM>\n            <NAME>SYS_ROLE_ACCESS_CREATE_CHK</NAME>\n            <CONDITION>CREATE_ACCESS_FLAG IN ('Y','N')</CONDITION>\n         </CHECK_CONSTRAINT_LIST_ITEM>\n         <CHECK_CONSTRAINT_LIST_ITEM>\n            <NAME>SYS_ROLE_ACCESS_READ_CHK</NAME>\n            <CONDITION>READ_ACCESS_FLAG IN ('Y','N')</CONDITION>\n         </CHECK_CONSTRAINT_LIST_ITEM>\n         <CHECK_CONSTRAINT_LIST_ITEM>\n            <NAME>SYS_ROLE_ACCESS_UPDATE_CHK</NAME>\n            <CONDITION>UPDATE_ACCESS_FLAG IN ('Y','N')</CONDITION>\n         </CHECK_CONSTRAINT_LIST_ITEM>\n         <CHECK_CONSTRAINT_LIST_ITEM>\n            <NAME>SYS_ROLE_ACCESS_DELETE_CHK</NAME>\n            <CONDITION>DELETE_ACCESS_FLAG IN ('Y','N')</CONDITION>\n         </CHECK_CONSTRAINT_LIST_ITEM>\n         <CHECK_CONSTRAINT_LIST_ITEM>\n            <NAME>SYS_ROLE_ACCESS_STATUS_CHK</NAME>\n            <CONDITION>STATUS_CODE IN ('ACTIVE', 'INACTIVE')</CONDITION>\n         </CHECK_CONSTRAINT_LIST_ITEM>\n      </CHECK_CONSTRAINT_LIST>\n      <PRIMARY_KEY_CONSTRAINT_LIST>\n         <PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n            <NAME>SYS_ROLE_ACCESS_PK</NAME>\n            <COL_LIST>\n               <COL_LIST_ITEM>\n                  <NAME>ACCESS_ID</NAME>\n               </COL_LIST_ITEM>\n            </COL_LIST>\n            <USING_INDEX></USING_INDEX>\n         </PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n      </PRIMARY_KEY_CONSTRAINT_LIST>\n      <DEFAULT_COLLATION>USING_NLS_COMP</DEFAULT_COLLATION>\n      <PHYSICAL_PROPERTIES>\n         <HEAP_TABLE></HEAP_TABLE>\n      </PHYSICAL_PROPERTIES>\n      \n   </RELATIONAL_TABLE>\n</TABLE>"}