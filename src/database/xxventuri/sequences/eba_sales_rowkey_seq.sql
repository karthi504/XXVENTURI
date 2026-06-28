create sequence xxventuri.eba_sales_rowkey_seq minvalue 1 maxvalue 9999999999999999999999999999 increment by 1 /* start with n */ cache
20 noorder nocycle nokeep noscale global;


-- sqlcl_snapshot {"hash":"2395ae15367aedcd648d87df141c309f50150938","type":"SEQUENCE","name":"EBA_SALES_ROWKEY_SEQ","schemaName":"XXVENTURI","sxml":"\n  <SEQUENCE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_ROWKEY_SEQ</NAME>\n   \n   <INCREMENT>1</INCREMENT>\n   <MINVALUE>1</MINVALUE>\n   <MAXVALUE>9999999999999999999999999999</MAXVALUE>\n   <CACHE>20</CACHE>\n   <SCALE>NOSCALE</SCALE>\n</SEQUENCE>"}