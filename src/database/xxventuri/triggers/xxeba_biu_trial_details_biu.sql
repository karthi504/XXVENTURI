create or replace editionable trigger xxventuri.xxeba_biu_trial_details_biu before
    insert or update on xxventuri.xxeba_trial_details
    for each row
declare begin
    if
        inserting
        and :new.trial_id is null
    then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.trial_id
        from
            dual;

    end if;

    if inserting then
        :new.created_date := localtimestamp;
        :new.created_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated_date := localtimestamp;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.status := 'N';
    elsif updating then
        :new.updated_date := localtimestamp;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
    end if;

end xxeba_biu_trial_details;
/

alter trigger xxventuri.xxeba_biu_trial_details_biu enable;


-- sqlcl_snapshot {"hash":"f95a200e720d77d11695b65aac11dec471d75cff","type":"TRIGGER","name":"XXEBA_BIU_TRIAL_DETAILS_BIU","schemaName":"XXVENTURI","sxml":""}