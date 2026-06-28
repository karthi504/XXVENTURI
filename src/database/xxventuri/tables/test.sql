create table xxventuri.test (
    created_date       timestamp(6),
    created_date_local timestamp(6) with local time zone
);


-- sqlcl_snapshot {"hash":"4b4ffcf4dcb9fa67c4581f10cca005df3094dbb0","type":"TABLE","name":"TEST","schemaName":"XXVENTURI","sxml":"\n  <TABLE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>TEST</NAME>\n   <RELATIONAL_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>CREATED_DATE</NAME>\n            <DATATYPE>TIMESTAMP</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>CREATED_DATE_LOCAL</NAME>\n            <DATATYPE>TIMESTAMP_WITH_LOCAL_TIMEZONE</DATATYPE>\n            <SCALE>6</SCALE>\n            \n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <DEFAULT_COLLATION>USING_NLS_COMP</DEFAULT_COLLATION>\n      <PHYSICAL_PROPERTIES>\n         <HEAP_TABLE></HEAP_TABLE>\n      </PHYSICAL_PROPERTIES>\n      \n   </RELATIONAL_TABLE>\n</TABLE>"}