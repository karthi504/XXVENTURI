create table xxventuri.eba_sales_files (
    id                 number,
    row_version_number number,
    deal_id            number,
    filename           varchar2(4000 byte),
    file_mimetype      varchar2(512 byte),
    file_charset       varchar2(512 byte),
    file_blob          blob,
    file_comments      varchar2(4000 byte),
    tags               varchar2(4000 byte),
    created            timestamp(6) with local time zone,
    created_by         varchar2(255 byte),
    updated            timestamp(6) with local time zone,
    updated_by         varchar2(255 byte),
    entity_type        varchar2(20 byte) not null disable,
    lead_id            number,
    territory_id       number,
    account_id         number,
    contact_id         number,
    product_id         number,
    attachment_type    varchar2(20 byte)
);

alter table xxventuri.eba_sales_files
    add constraint eba_sales_files_ent_fk_ck
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
                and product_id is not null ) disable;

alter table xxventuri.eba_sales_files
    add constraint eba_sales_files_ent_type_ck
        check ( entity_type in ( 'OPPORTUNITY', 'LEAD', 'TERRITORY', 'ACCOUNT', 'CONTACT',
                                 'PRODUCT' ) ) enable;

alter table xxventuri.eba_sales_files
    add constraint eba_sales_files_pk primary key ( id )
        using index enable;


-- sqlcl_snapshot {"hash":"a4a7b7668f42cb3cf0a4c819fd6eb4b7b8211425","type":"TABLE","name":"EBA_SALES_FILES","schemaName":"XXVENTURI","sxml":"\n  <TABLE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_FILES</NAME>\n   <RELATIONAL_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ROW_VERSION_NUMBER</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>DEAL_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FILENAME</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>4000</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FILE_MIMETYPE</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>512</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FILE_CHARSET</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>512</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FILE_BLOB</NAME>\n            <DATATYPE>BLOB</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FILE_COMMENTS</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>4000</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>TAGS</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>4000</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED</NAME>\n            <DATATYPE>TIMESTAMP_WITH_LOCAL_TIMEZONE</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>255</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATED</NAME>\n            <DATATYPE>TIMESTAMP_WITH_LOCAL_TIMEZONE</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>255</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ENTITY_TYPE</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>20</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <NOT_NULL>\n               <DISABLE></DISABLE>\n               <NOVALIDATE></NOVALIDATE>\n            </NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>LEAD_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>TERRITORY_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ACCOUNT_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CONTACT_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>PRODUCT_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ATTACHMENT_TYPE</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>20</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <CHECK_CONSTRAINT_LIST>\n         <CHECK_CONSTRAINT_LIST_ITEM>\n            <NAME>EBA_SALES_FILES_ENT_FK_CK</NAME>\n            <CONDITION>\n  entity_type = 'OPPORTUNITY' and deal_id is not null\n    or entity_type = 'LEAD' and lead_id is not null\n    or entity_type = 'TERRITORY' and territory_id is not null\n    or entity_type = 'ACCOUNT' and account_id is not null\n    or entity_type = 'CONTACT' and contact_id is not null\n    or entity_type = 'PRODUCT' and product_id is not null\n</CONDITION>\n            <DISABLE></DISABLE>\n            <NOVALIDATE></NOVALIDATE>\n         </CHECK_CONSTRAINT_LIST_ITEM>\n         <CHECK_CONSTRAINT_LIST_ITEM>\n            <NAME>EBA_SALES_FILES_ENT_TYPE_CK</NAME>\n            <CONDITION>entity_type in ('OPPORTUNITY','LEAD','TERRITORY','ACCOUNT', 'CONTACT', 'PRODUCT')</CONDITION>\n         </CHECK_CONSTRAINT_LIST_ITEM>\n      </CHECK_CONSTRAINT_LIST>\n      <PRIMARY_KEY_CONSTRAINT_LIST>\n         <PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n            <NAME>EBA_SALES_FILES_PK</NAME>\n            <COL_LIST>\n               <COL_LIST_ITEM>\n                  <NAME>ID</NAME>\n               </COL_LIST_ITEM>\n            </COL_LIST>\n            <USING_INDEX></USING_INDEX>\n         </PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n      </PRIMARY_KEY_CONSTRAINT_LIST>\n      <DEFAULT_COLLATION>USING_NLS_COMP</DEFAULT_COLLATION>\n      <PHYSICAL_PROPERTIES>\n         <HEAP_TABLE></HEAP_TABLE>\n      </PHYSICAL_PROPERTIES>\n      \n   </RELATIONAL_TABLE>\n</TABLE>"}