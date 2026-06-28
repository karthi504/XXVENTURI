create table xxventuri.eba_sales_comments (
    id                 number,
    row_version_number number,
    row_key            varchar2(255 byte),
    deal_id            number,
    note               clob not null enable,
    created_by         varchar2(255 byte),
    created            timestamp(6) with local time zone,
    updated_by         varchar2(255 byte),
    updated            timestamp(6) with local time zone,
    entity_type        varchar2(20 byte) not null enable,
    lead_id            number,
    territory_id       number,
    account_id         number,
    contact_id         number,
    product_id         number
);

alter table xxventuri.eba_sales_comments
    add constraint eba_sales_comments_ent_fk_ck
        check ( entity_type = 'OPPORTUNITY'
                and deal_id is not null
                or entity_type = 'LEAD'
                and lead_id is not null
                or entity_type = 'TERRITORY'
                and territory_id is not null
                or entity_type = 'ACCOUNT'
                and account_id is not null
                or entity_type = 'CONTACT'
                and contact_id is not null
                or entity_type = 'PRODUCT'
                and product_id is not null ) enable;

alter table xxventuri.eba_sales_comments
    add constraint eba_sales_comments_ent_type_ck
        check ( entity_type in ( 'OPPORTUNITY', 'LEAD', 'TERRITORY', 'ACCOUNT', 'CONTACT',
                                 'PRODUCT' ) ) enable;

alter table xxventuri.eba_sales_comments add primary key ( id )
    using index enable;


-- sqlcl_snapshot {"hash":"2b06ee7ce365d19cf6c4f69904e5130362c0b627","type":"TABLE","name":"EBA_SALES_COMMENTS","schemaName":"XXVENTURI","sxml":"\n  <TABLE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_COMMENTS</NAME>\n   <RELATIONAL_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ROW_VERSION_NUMBER</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ROW_KEY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>255</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>DEAL_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>NOTE</NAME>\n            <DATATYPE>CLOB</DATATYPE>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>255</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED</NAME>\n            <DATATYPE>TIMESTAMP_WITH_LOCAL_TIMEZONE</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>255</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATED</NAME>\n            <DATATYPE>TIMESTAMP_WITH_LOCAL_TIMEZONE</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ENTITY_TYPE</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>20</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>LEAD_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>TERRITORY_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ACCOUNT_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CONTACT_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>PRODUCT_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <CHECK_CONSTRAINT_LIST>\n         <CHECK_CONSTRAINT_LIST_ITEM>\n            <NAME>EBA_SALES_COMMENTS_ENT_TYPE_CK</NAME>\n            <CONDITION>entity_type in ('OPPORTUNITY','LEAD','TERRITORY','ACCOUNT', 'CONTACT', 'PRODUCT')</CONDITION>\n         </CHECK_CONSTRAINT_LIST_ITEM>\n         <CHECK_CONSTRAINT_LIST_ITEM>\n            <NAME>EBA_SALES_COMMENTS_ENT_FK_CK</NAME>\n            <CONDITION>\n  entity_type = 'OPPORTUNITY' and deal_id is not null\n    or entity_type = 'LEAD' and lead_id is not null\n    or entity_type = 'TERRITORY' and territory_id is not null\n    or entity_type = 'ACCOUNT' and account_id is not null\n    or entity_type = 'CONTACT' and contact_id is not null\n    or entity_type = 'PRODUCT' and product_id is not null\n</CONDITION>\n         </CHECK_CONSTRAINT_LIST_ITEM>\n      </CHECK_CONSTRAINT_LIST>\n      <PRIMARY_KEY_CONSTRAINT_LIST>\n         <PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n            <COL_LIST>\n               <COL_LIST_ITEM>\n                  <NAME>ID</NAME>\n               </COL_LIST_ITEM>\n            </COL_LIST>\n            <USING_INDEX></USING_INDEX>\n         </PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n      </PRIMARY_KEY_CONSTRAINT_LIST>\n      <DEFAULT_COLLATION>USING_NLS_COMP</DEFAULT_COLLATION>\n      <PHYSICAL_PROPERTIES>\n         <HEAP_TABLE></HEAP_TABLE>\n      </PHYSICAL_PROPERTIES>\n      \n   </RELATIONAL_TABLE>\n</TABLE>"}