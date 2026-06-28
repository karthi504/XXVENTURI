create table xxventuri.consent_ledger (
    ledger_id       varchar2(100 byte),
    subject_id      varchar2(50 byte),
    type_id         varchar2(50 byte),
    action_type     varchar2(20 byte),
    previous_hash   raw(64),
    current_hash    raw(64) not null enable,
    consent_details varchar2(1000 byte),
    valid_until     date,
    created_date    timestamp(6) default current_timestamp,
    created_by      varchar2(100 byte) default user
);

alter table xxventuri.consent_ledger
    add
        check ( action_type in ( 'GRANT', 'REVOKE', 'MODIFY' ) ) disable;

alter table xxventuri.consent_ledger add primary key ( ledger_id )
    using index enable;


-- sqlcl_snapshot {"hash":"b721a81f7b8e1ab46937c76d320ed070a808108b","type":"TABLE","name":"CONSENT_LEDGER","schemaName":"XXVENTURI","sxml":"\n  <TABLE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>CONSENT_LEDGER</NAME>\n   <RELATIONAL_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>LEDGER_ID</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>100</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>SUBJECT_ID</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>50</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>TYPE_ID</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>50</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ACTION_TYPE</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>20</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>PREVIOUS_HASH</NAME>\n            <DATATYPE>RAW</DATATYPE>\n            <LENGTH>64</LENGTH>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CURRENT_HASH</NAME>\n            <DATATYPE>RAW</DATATYPE>\n            <LENGTH>64</LENGTH>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CONSENT_DETAILS</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>1000</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>VALID_UNTIL</NAME>\n            <DATATYPE>DATE</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED_DATE</NAME>\n            <DATATYPE>TIMESTAMP</DATATYPE>\n            <SCALE>6</SCALE>\n            <DEFAULT>CURRENT_TIMESTAMP</DEFAULT>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>100</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <DEFAULT>USER</DEFAULT>\n            \n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <CHECK_CONSTRAINT_LIST>\n         <CHECK_CONSTRAINT_LIST_ITEM>\n            <CONDITION>action_type IN ('GRANT','REVOKE','MODIFY')</CONDITION>\n            <DISABLE></DISABLE>\n            <NOVALIDATE></NOVALIDATE>\n         </CHECK_CONSTRAINT_LIST_ITEM>\n      </CHECK_CONSTRAINT_LIST>\n      <PRIMARY_KEY_CONSTRAINT_LIST>\n         <PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n            <COL_LIST>\n               <COL_LIST_ITEM>\n                  <NAME>LEDGER_ID</NAME>\n               </COL_LIST_ITEM>\n            </COL_LIST>\n            <USING_INDEX></USING_INDEX>\n         </PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n      </PRIMARY_KEY_CONSTRAINT_LIST>\n      <DEFAULT_COLLATION>USING_NLS_COMP</DEFAULT_COLLATION>\n      <PHYSICAL_PROPERTIES>\n         <HEAP_TABLE></HEAP_TABLE>\n      </PHYSICAL_PROPERTIES>\n      \n   </RELATIONAL_TABLE>\n</TABLE>"}