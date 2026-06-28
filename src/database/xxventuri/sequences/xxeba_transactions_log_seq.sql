create sequence xxventuri.xxeba_transactions_log_seq minvalue 0 maxvalue 99999999999999999999 increment by 1 /* start with n */ nocache
noorder nocycle nokeep noscale global;


-- sqlcl_snapshot {"hash":"28a469f7f990500911eba5ce5e8146b363c50653","type":"SEQUENCE","name":"XXEBA_TRANSACTIONS_LOG_SEQ","schemaName":"XXVENTURI","sxml":"\n  <SEQUENCE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>XXEBA_TRANSACTIONS_LOG_SEQ</NAME>\n   \n   <INCREMENT>1</INCREMENT>\n   <MINVALUE>0</MINVALUE>\n   <MAXVALUE>99999999999999999999</MAXVALUE>\n   <CACHE>0</CACHE>\n   <SCALE>NOSCALE</SCALE>\n</SEQUENCE>"}