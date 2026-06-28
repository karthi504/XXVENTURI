create sequence xxventuri.http_blob_test_seq minvalue 1 maxvalue 9999999999999999999999999999 increment by 1 /* start with n */ cache
20 noorder nocycle nokeep noscale global;


-- sqlcl_snapshot {"hash":"705c881f673ead3c542e34d1b37a9250056a2671","type":"SEQUENCE","name":"HTTP_BLOB_TEST_SEQ","schemaName":"XXVENTURI","sxml":"\n  <SEQUENCE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>HTTP_BLOB_TEST_SEQ</NAME>\n   \n   <INCREMENT>1</INCREMENT>\n   <MINVALUE>1</MINVALUE>\n   <MAXVALUE>9999999999999999999999999999</MAXVALUE>\n   <CACHE>20</CACHE>\n   <SCALE>NOSCALE</SCALE>\n</SEQUENCE>"}