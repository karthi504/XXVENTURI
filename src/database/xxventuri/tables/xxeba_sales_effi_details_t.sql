create table xxventuri.xxeba_sales_effi_details_t (
    details_id       number,
    efficiency_id    number,
    component_name   varchar2(300 byte),
    component_score  number,
    data_source      varchar2(1 byte),
    status           varchar2(1 byte),
    created_by       varchar2(255 byte),
    creation_date    timestamp(6),
    updated_by       varchar2(255 byte),
    update_date      timestamp(6),
    display_sequence number
);

alter table xxventuri.xxeba_sales_effi_details_t
    add constraint xxeba_sales_effi_details_pk primary key ( details_id )
        using index enable;


-- sqlcl_snapshot {"hash":"097a4d0c7f279fe0b365f87459cbd5a1cf34d534","type":"TABLE","name":"XXEBA_SALES_EFFI_DETAILS_T","schemaName":"XXVENTURI","sxml":"\n  <TABLE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>XXEBA_SALES_EFFI_DETAILS_T</NAME>\n   <RELATIONAL_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>DETAILS_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>EFFICIENCY_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>COMPONENT_NAME</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>300</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>COMPONENT_SCORE</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>DATA_SOURCE</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>1</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>STATUS</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>1</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>255</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATION_DATE</NAME>\n            <DATATYPE>TIMESTAMP</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>255</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATE_DATE</NAME>\n            <DATATYPE>TIMESTAMP</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>DISPLAY_SEQUENCE</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <PRIMARY_KEY_CONSTRAINT_LIST>\n         <PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n            <NAME>XXEBA_SALES_EFFI_DETAILS_PK</NAME>\n            <COL_LIST>\n               <COL_LIST_ITEM>\n                  <NAME>DETAILS_ID</NAME>\n               </COL_LIST_ITEM>\n            </COL_LIST>\n            <USING_INDEX></USING_INDEX>\n         </PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n      </PRIMARY_KEY_CONSTRAINT_LIST>\n      <DEFAULT_COLLATION>USING_NLS_COMP</DEFAULT_COLLATION>\n      <PHYSICAL_PROPERTIES>\n         <HEAP_TABLE></HEAP_TABLE>\n      </PHYSICAL_PROPERTIES>\n      \n   </RELATIONAL_TABLE>\n</TABLE>"}