create or replace editionable trigger xxventuri.emp_trg1 before
    insert on xxventuri.emp
    for each row
begin
    if :new.empno is null then
        select
            emp_seq.nextval
        into :new.empno
        from
            sys.dual;

    end if;
end;
/

alter trigger xxventuri.emp_trg1 enable;


-- sqlcl_snapshot {"hash":"e932c0bed5a581f2368540439ea867b1c806420a","type":"TRIGGER","name":"EMP_TRG1","schemaName":"XXVENTURI","sxml":""}