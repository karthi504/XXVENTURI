create or replace editionable trigger xxventuri.biu_eba_demo_cal_projects before
    insert or update on xxventuri.eba_demo_cal_projects
    for each row
begin
    if :new.id is null then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.id
        from
            dual;

    end if;

    if inserting then
        :new.row_version_number := 1;
    elsif updating then
        :new.row_version_number := nvl(:old.row_version_number,
                                       1) + 1;
    end if;

    if :new.start_date > :new.end_date then
        raise_application_error(-20001, 'Error start date must be before end date');
    end if;

end;
/

alter trigger xxventuri.biu_eba_demo_cal_projects enable;


-- sqlcl_snapshot {"hash":"abe9401637db7bedb98359538f964f5a31ca5d39","type":"TRIGGER","name":"BIU_EBA_DEMO_CAL_PROJECTS","schemaName":"XXVENTURI","sxml":""}