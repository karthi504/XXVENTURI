create or replace editionable trigger xxventuri.xxeba_trial_exists_results_biu before
    insert or update on xxventuri.xxeba_trial_exists_results_t
    for each row
declare begin
    if
        inserting
        and :new.result_id is null
    then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.result_id
        from
            dual;

    end if;

    if inserting then
        :new.created_date := localtimestamp;
        :new.created_by := nvl(wwv_flow.g_user, user);
        :new.updated_date := localtimestamp;
        :new.updated_by := nvl(wwv_flow.g_user, user);
        :new.status := 'Y';
    elsif updating then
        :new.updated_date := localtimestamp;
        :new.updated_by := nvl(wwv_flow.g_user, user);
    end if;

end xxeba_trial_exists_results_biu;
/

alter trigger xxventuri.xxeba_trial_exists_results_biu enable;


-- sqlcl_snapshot {"hash":"698e84eebca8ec004563a813a59813012fd1bf29","type":"TRIGGER","name":"XXEBA_TRIAL_EXISTS_RESULTS_BIU","schemaName":"XXVENTURI","sxml":""}