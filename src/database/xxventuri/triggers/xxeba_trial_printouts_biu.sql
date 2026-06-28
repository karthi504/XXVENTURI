create or replace editionable trigger xxventuri.xxeba_trial_printouts_biu before
    insert or update on xxventuri.xxeba_trial_printouts_t
    for each row
begin
    if
        inserting
        and :new.printout_id is null
    then
        select
            xxeba_trial_printouts_seq.nextval
        into :new.printout_id
        from
            dual;

    end if;

    if inserting then
        :new.status := 'Y';
        :new.created_by := nvl(
            v('APP_USER'),
            user
        );
        :new.creation_date := localtimestamp;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.update_date := localtimestamp;
    elsif updating then
        null;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.update_date := localtimestamp;
    end if;

end;
/

alter trigger xxventuri.xxeba_trial_printouts_biu enable;


-- sqlcl_snapshot {"hash":"a6764256aedba031afddc8eb588f5c00e8a0a505","type":"TRIGGER","name":"XXEBA_TRIAL_PRINTOUTS_BIU","schemaName":"XXVENTURI","sxml":""}