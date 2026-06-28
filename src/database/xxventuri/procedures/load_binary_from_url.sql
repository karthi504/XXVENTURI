create or replace procedure xxventuri.load_binary_from_url (
    p_url in varchar2
) as
    l_blob blob;
begin
    l_blob := httpuritype.createuri(p_url).getblob();

  -- Insert the data into the table.
 --insert into Eba_Sales_Files (deal_id,filename,FILE_MIMETYPE,file_blob,ENTITY_TYPE) values (58,'sucess.pdf','application/pdf',l_blob,'OPPORTUNITY'); 
    insert into http_blob_test (
        id,
        url,
        data
    ) values ( http_blob_test_seq.nextval,
               p_url,
               l_blob );

end load_binary_from_url;
/


-- sqlcl_snapshot {"hash":"85400e7bec205800bdb58f5d42b0a4147038aec3","type":"PROCEDURE","name":"LOAD_BINARY_FROM_URL","schemaName":"XXVENTURI","sxml":""}