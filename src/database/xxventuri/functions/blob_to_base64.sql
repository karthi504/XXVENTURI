create or replace function xxventuri.blob_to_base64 (
    p_blob blob
) return clob is
    v_clob       clob;
    v_chunk_size pls_integer := 24000;
begin
    for v_i in 0..trunc((dbms_lob.getlength(p_blob) - 1) / v_chunk_size) loop
        v_clob := v_clob
                  || utl_raw.cast_to_varchar2(utl_encode.base64_encode(dbms_lob.substr(p_blob, v_chunk_size, v_i * v_chunk_size + 1))
                  );
    end loop;

    return v_clob;
end;
/


-- sqlcl_snapshot {"hash":"114738023035607772464c436050c9db29eb8b3b","type":"FUNCTION","name":"BLOB_TO_BASE64","schemaName":"XXVENTURI","sxml":""}