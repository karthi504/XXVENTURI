create table xxventuri.eba_sales_sales_periods (
    id                 number,
    row_version_number number,
    period_name        varchar2(255 byte) not null enable,
    first_day          timestamp(6) with local time zone,
    last_day           timestamp(6) with local time zone,
    fiscal_year        number(2, 0)
);

alter table xxventuri.eba_sales_sales_periods add primary key ( id )
    using index enable;


-- sqlcl_snapshot {"hash":"5d37327eff161b8c3cab9a30e09b4cb759946a7f","type":"TABLE","name":"EBA_SALES_SALES_PERIODS","schemaName":"XXVENTURI","sxml":"\n  <TABLE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_SALES_PERIODS</NAME>\n   <RELATIONAL_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ROW_VERSION_NUMBER</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>PERIOD_NAME</NAME>\n            <DATATYPE>VARCHAR2</DATATYPE>\n            <LENGTH>255</LENGTH>\n            <COLLATE_NAME>USING_NLS_COMP</COLLATE_NAME>\n            <NOT_NULL></NOT_NULL>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FIRST_DAY</NAME>\n            <DATATYPE>TIMESTAMP_WITH_LOCAL_TIMEZONE</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>LAST_DAY</NAME>\n            <DATATYPE>TIMESTAMP_WITH_LOCAL_TIMEZONE</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>FISCAL_YEAR</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            <PRECISION>2</PRECISION>\n            <SCALE>0</SCALE>\n            \n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <PRIMARY_KEY_CONSTRAINT_LIST>\n         <PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n            <COL_LIST>\n               <COL_LIST_ITEM>\n                  <NAME>ID</NAME>\n               </COL_LIST_ITEM>\n            </COL_LIST>\n            <USING_INDEX></USING_INDEX>\n         </PRIMARY_KEY_CONSTRAINT_LIST_ITEM>\n      </PRIMARY_KEY_CONSTRAINT_LIST>\n      <DEFAULT_COLLATION>USING_NLS_COMP</DEFAULT_COLLATION>\n      <PHYSICAL_PROPERTIES>\n         <HEAP_TABLE></HEAP_TABLE>\n      </PHYSICAL_PROPERTIES>\n      \n   </RELATIONAL_TABLE>\n</TABLE>"}