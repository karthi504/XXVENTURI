create table xxventuri.xxeba_mass_emails_t (
    mass_email_id number,
    template_id   number,
    mail_content  clob,
    status        char(1 byte),
    created_by    varchar2(255 byte),
    created_date  timestamp(6),
    updated_by    varchar2(255 byte),
    updated_date  timestamp(6),
    industry_id   varchar2(4000 byte)
);

alter table xxventuri.xxeba_mass_emails_t
    add constraint xxeba_mass_emails_pk primary key ( mass_email_id )
        using index enable;


-- sqlcl_snapshot {"hash":"4a3f80e5f117a6c906fa42a29b4d2d7d09c17907","type":"TABLE","name":"XXEBA_MASS_EMAILS_T","schemaName":"XXVENTURI","sxml":"\n  <TABLE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>XXEBA_MASS_EMAILS_T</NAME>\n   <RELATIONAL_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>MASS_EMAIL_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>TEMPLATE_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>MAIL_CONTENT</NAME>\n            <DATATYPE>CLOB</DATATYPE>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>STATUS</NAME>\n            <DATATYPE>CHAR</DATATYPE>\n            <LENGTH>1</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>255</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED_DATE</NAME>\n            <DATATYPE>TIMESTAMP</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>255</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATED_DATE</NAME>\n            <DATATYPE>TIMESTAMP</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>INDUSTRY_ID</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>4000</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <PRIMARY_KEY_CONSTRAINT_LIST>\n         <PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n            <NAME>XXEBA_MASS_EMAILS_PK</NAME>\n            <COL_LIST>\n               <COL_LIST_ITEM>\n                  <NAME>MASS_EMAIL_ID</NAME>\n               </COL_LIST_ITEM>\n            </COL_LIST>\n            <USING_INDEX></USING_INDEX>\n         </PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n      </PRIMARY_KEY_CONSTRAINT_LIST>\n      <DEFAULT_COLLATION>USING_NLS_COMP</DEFAULT_COLLATION>\n      <PHYSICAL_PROPERTIES>\n         <HEAP_TABLE></HEAP_TABLE>\n      </PHYSICAL_PROPERTIES>\n      \n   </RELATIONAL_TABLE>\n</TABLE>"}