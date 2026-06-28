create or replace procedure xxventuri.dml_test_ins (
    p_text varchar2
) as
    pragma autonomous_transaction;
begin
    insert into dml_test (
        id,
        text
    ) values ( (
        select
            nvl(
                max(id),
                0
            ) + 1
        from
            dml_test
    ),
               p_text );

    commit;
end;
/


-- sqlcl_snapshot {"hash":"325ab6927429d2467da857948d3ed7541f2416b2","type":"PROCEDURE","name":"DML_TEST_INS","schemaName":"XXVENTURI","sxml":""}