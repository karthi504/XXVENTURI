create or replace editionable trigger xxventuri.xxeba_biu_meeting_schedule before
    insert or update on xxventuri.xxeba_sales_meeting_schedule
    for each row
declare begin
    if
        inserting
        and :new.schedule_id is null
    then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.schedule_id
        from
            dual;

    end if;

    if inserting then
        :new.created := localtimestamp;
        :new.created_by := nvl(wwv_flow.g_user, user);
        :new.updated := localtimestamp;
        :new.updated_by := nvl(wwv_flow.g_user, user);
        :new.status := 'Y';	
	--	:new.row_version_number := 1;       
    elsif updating then       
	--	:new.row_version_number := nvl(:old.row_version_number,1) + 1;         
        :new.updated := localtimestamp;
        :new.updated_by := nvl(wwv_flow.g_user, user);
    end if;

end;
/

alter trigger xxventuri.xxeba_biu_meeting_schedule enable;


-- sqlcl_snapshot {"hash":"5ac9c0762f22bf66232f6bebf61a781c41055803","type":"TRIGGER","name":"XXEBA_BIU_MEETING_SCHEDULE","schemaName":"XXVENTURI","sxml":""}