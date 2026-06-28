create table xxventuri.eba_sales_verifications (
    id                   number,
    cust_id              number,
    lead_id              number,
    opp_id               number,
    verification_comment varchar2(4000 byte),
    created              timestamp(6) with local time zone,
    created_by           varchar2(255 byte),
    updated              timestamp(6) with local time zone,
    updated_by           varchar2(255 byte),
    territory_id         number,
    entity_type          varchar2(20 byte) not null enable,
    contact_id           number,
    product_id           number,
    verified_by          varchar2(255 byte),
    verification_status  varchar2(50 byte)
);

alter table xxventuri.eba_sales_verifications
    add constraint eba_sales_verif_ent_fk_ck
        check ( entity_type = 'OPPORTUNITY'
                and opp_id is not null
                or entity_type = 'LEAD'
                and lead_id is not null
                or entity_type = 'TERRITORY'
                and territory_id is not null
                or entity_type = 'ACCOUNT'
                and cust_id is not null
                or entity_type = 'CONTACT'
                and contact_id is not null
                or entity_type = 'PRODUCT'
                and product_id is not null ) disable;

alter table xxventuri.eba_sales_verifications
    add constraint eba_sales_verif_ent_type_ck
        check ( entity_type in ( 'OPPORTUNITY', 'LEAD', 'TERRITORY', 'ACCOUNT', 'CONTACT',
                                 'PRODUCT' ) ) disable;

alter table xxventuri.eba_sales_verifications add primary key ( id )
    using index enable;


-- sqlcl_snapshot {"hash":"70534eed56a41c41bd1c1d8aec217e50cc8c744b","type":"TABLE","name":"EBA_SALES_VERIFICATIONS","schemaName":"XXVENTURI","sxml":"\n  <TABLE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_VERIFICATIONS</NAME>\n   <RELATIONAL_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CUST_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>LEAD_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>OPP_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>VERIFICATION_COMMENT</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>4000</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED</NAME>\n            <DATATYPE>TIMESTAMP_WITH_LOCAL_TIMEZONE</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>255</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATED</NAME>\n            <DATATYPE>TIMESTAMP_WITH_LOCAL_TIMEZONE</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>UPDATED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>255</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>TERRITORY_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ENTITY_TYPE</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>20</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CONTACT_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>PRODUCT_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>VERIFIED_BY</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>255</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>VERIFICATION_STATUS</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>50</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            \n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <CHECK_CONSTRAINT_LIST>\n         <CHECK_CONSTRAINT_LIST_ITEM>\n            <NAME>EBA_SALES_VERIF_ENT_TYPE_CK</NAME>\n            <CONDITION>entity_type in ('OPPORTUNITY','LEAD','TERRITORY','ACCOUNT', 'CONTACT', 'PRODUCT')</CONDITION>\n            <DISABLE></DISABLE>\n            <NOVALIDATE></NOVALIDATE>\n         </CHECK_CONSTRAINT_LIST_ITEM>\n         <CHECK_CONSTRAINT_LIST_ITEM>\n            <NAME>EBA_SALES_VERIF_ENT_FK_CK</NAME>\n            <CONDITION>\n  entity_type = 'OPPORTUNITY' and opp_id is not null\n    or entity_type = 'LEAD' and lead_id is not null\n    or entity_type = 'TERRITORY' and territory_id is not null\n    or entity_type = 'ACCOUNT' and cust_id is not null\n    or entity_type = 'CONTACT' and contact_id is not null\n    or entity_type = 'PRODUCT' and product_id is not null\n</CONDITION>\n            <DISABLE></DISABLE>\n            <NOVALIDATE></NOVALIDATE>\n         </CHECK_CONSTRAINT_LIST_ITEM>\n      </CHECK_CONSTRAINT_LIST>\n      <PRIMARY_KEY_CONSTRAINT_LIST>\n         <PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n            <COL_LIST>\n               <COL_LIST_ITEM>\n                  <NAME>ID</NAME>\n               </COL_LIST_ITEM>\n            </COL_LIST>\n            <USING_INDEX></USING_INDEX>\n         </PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n      </PRIMARY_KEY_CONSTRAINT_LIST>\n      <DEFAULT_COLLATION>USING_NLS_COMP</DEFAULT_COLLATION>\n      <PHYSICAL_PROPERTIES>\n         <HEAP_TABLE></HEAP_TABLE>\n      </PHYSICAL_PROPERTIES>\n      \n   </RELATIONAL_TABLE>\n</TABLE>"}