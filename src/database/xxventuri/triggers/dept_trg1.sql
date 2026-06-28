create or replace editionable trigger xxventuri.dept_trg1 before
    insert on xxventuri.dept
    for each row
begin
    if :new.deptno is null then
        select
            dept_seq.nextval
        into :new.deptno
        from
            sys.dual;

    end if;
end;
/

alter trigger xxventuri.dept_trg1 enable;


-- sqlcl_snapshot {"hash":"8db8d494d7a7556cd0cffa1074c9f9117f793041","type":"TRIGGER","name":"DEPT_TRG1","schemaName":"XXVENTURI","sxml":""}