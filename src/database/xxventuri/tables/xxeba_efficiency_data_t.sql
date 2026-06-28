create table xxventuri.xxeba_efficiency_data_t (
    efficiency_id   number,
    period_name     varchar2(100 byte),
    perf_from_date  date,
    perf_to_date    date,
    sales_rep_id    number,
    efficiency_type varchar2(100 byte),
    perf_score      number,
    perf_rewards    number,
    status          varchar2(1 byte),
    created_by      varchar2(255 byte),
    created_date    timestamp(6),
    updated_by      varchar2(255 byte),
    updated_date    timestamp(6)
);

alter table xxventuri.xxeba_efficiency_data_t
    add constraint xxeba_efficiency_data_pk primary key ( efficiency_id )
        using index enable;


-- sqlcl_snapshot {"hash":"e696082306913510aa4b5b449ad1b71854cf1b34","type":"TABLE","name":"XXEBA_EFFICIENCY_DATA_T","schemaName":"XXVENTURI","sxml":"\n  <TABLE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>XXEBA_EFFICIENCY_DATA_T</NAME>\n   <RELATIONAL_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>EFFICIENCY_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>PERIOD_NAME</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>100</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>PERF_FROM_DATE</NAME>\n            <DATATYPE>DATE</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>PERF_TO_DATE</NAME>\n            <DATATYPE>DATE</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>SALES_REP_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>EFFICIENCY_TYPE</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>100</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>PERF_SCORE</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>PERF_REWARDS</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>STATUS</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>1</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>255</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED_DATE</NAME>\n            <DATATYPE>TIMESTAMP</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>255</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATED_DATE</NAME>\n            <DATATYPE>TIMESTAMP</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <PRIMARY_KEY_CONSTRAINT_LIST>\n         <PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n            <NAME>XXEBA_EFFICIENCY_DATA_PK</NAME>\n            <COL_LIST>\n               <COL_LIST_ITEM>\n                  <NAME>EFFICIENCY_ID</NAME>\n               </COL_LIST_ITEM>\n            </COL_LIST>\n            <USING_INDEX></USING_INDEX>\n         </PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n      </PRIMARY_KEY_CONSTRAINT_LIST>\n      <DEFAULT_COLLATION>USING_NLS_COMP</DEFAULT_COLLATION>\n      <PHYSICAL_PROPERTIES>\n         <HEAP_TABLE></HEAP_TABLE>\n      </PHYSICAL_PROPERTIES>\n      \n   </RELATIONAL_TABLE>\n</TABLE>"}