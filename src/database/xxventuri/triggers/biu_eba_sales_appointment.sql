create or replace editionable trigger xxventuri.biu_eba_sales_appointment before
    insert or update on xxventuri.xxeba_sales_appointment
    for each row
begin
    if :new.appointment_id is null then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.appointment_id
        from
            dual;

    end if;

    if inserting then
        :new.created := localtimestamp;
        :new.created_by := nvl(wwv_flow.g_user, user);
        :new.updated := localtimestamp;
        :new.updated_by := nvl(wwv_flow.g_user, user);
        :new.row_version_number := 1;
        if :new.appointment_status is null then
            :new.appointment_status := 'Scheduled';
        end if;

    elsif updating then
        :new.row_version_number := nvl(:old.row_version_number,
                                       1) + 1;
    end if;

    if inserting
    or updating then
        :new.updated := localtimestamp;
        :new.updated_by := nvl(wwv_flow.g_user, user);
    end if;

end;
/

alter trigger xxventuri.biu_eba_sales_appointment enable;


-- sqlcl_snapshot {"hash":"d5d1b091e618c214fadbdd3569adeaa5a6ac18d8","type":"TRIGGER","name":"BIU_EBA_SALES_APPOINTMENT","schemaName":"XXVENTURI","sxml":""}