create or replace editionable trigger xxventuri.xlib_logs_bi_trg before
    insert on xxventuri.xlib_logs
    referencing
            new as new
            old as old
    for each row
begin
    if :new.log_id is null then
        select
            xlib_seq.nextval
        into :new.log_id
        from
            dual;

    end if;
end;
/

alter trigger xxventuri.xlib_logs_bi_trg enable;


-- sqlcl_snapshot {"hash":"5e62a8277dfe15301b850044f2406354aea19cfb","type":"TRIGGER","name":"XLIB_LOGS_BI_TRG","schemaName":"XXVENTURI","sxml":""}