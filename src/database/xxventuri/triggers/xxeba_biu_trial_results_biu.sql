create or replace editionable trigger xxventuri.xxeba_biu_trial_results_biu before
    insert or update on xxventuri.xxeba_trial_edge_results
    for each row
declare begin
    if
        inserting
        and :new.edge_result_id is null
    then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.edge_result_id
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

end xxeba_trial_edge_results;
/

alter trigger xxventuri.xxeba_biu_trial_results_biu enable;


-- sqlcl_snapshot {"hash":"2989fe8e8c126510476d180d4902935a7eb477d4","type":"TRIGGER","name":"XXEBA_BIU_TRIAL_RESULTS_BIU","schemaName":"XXVENTURI","sxml":""}