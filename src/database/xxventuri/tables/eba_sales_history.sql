create table xxventuri.eba_sales_history (
    id                 number,
    row_version_number number,
    deal_id            number,
    deal_rowkey        varchar2(30 byte),
    column_name        varchar2(60 byte) not null enable,
    old_value          varchar2(4000 byte),
    new_value          varchar2(4000 byte),
    change_date        timestamp(6) with local time zone,
    changed_by         varchar2(255 byte)
);

alter table xxventuri.eba_sales_history
    add constraint eba_sales_history_pk primary key ( id )
        using index enable;


-- sqlcl_snapshot {"hash":"fa4c8c7ec9774bae7255284aef968f93bf795ec5","type":"TABLE","name":"EBA_SALES_HISTORY","schemaName":"XXVENTURI","sxml":"\n  <TABLE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_HISTORY</NAME>\n   <RELATIONAL_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ROW_VERSION_NUMBER</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>DEAL_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>DEAL_ROWKEY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>30</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>COLUMN_NAME</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>60</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>OLD_VALUE</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>4000</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>NEW_VALUE</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>4000</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CHANGE_DATE</NAME>\n            <DATATYPE>TIMESTAMP_WITH_LOCAL_TIMEZONE</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CHANGED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>255</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <PRIMARY_KEY_CONSTRAINT_LIST>\n         <PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n            <NAME>EBA_SALES_HISTORY_PK</NAME>\n            <COL_LIST>\n               <COL_LIST_ITEM>\n                  <NAME>ID</NAME>\n               </COL_LIST_ITEM>\n            </COL_LIST>\n            <USING_INDEX></USING_INDEX>\n         </PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n      </PRIMARY_KEY_CONSTRAINT_LIST>\n      <DEFAULT_COLLATION>USING_NLS_COMP</DEFAULT_COLLATION>\n      <PHYSICAL_PROPERTIES>\n         <HEAP_TABLE></HEAP_TABLE>\n      </PHYSICAL_PROPERTIES>\n      \n   </RELATIONAL_TABLE>\n</TABLE>"}