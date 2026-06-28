create or replace editionable trigger xxventuri.biu_eba_sales_crm_appointments before
    insert or update on xxventuri.xxeba_sales_crm_appointments
    for each row
begin
    if :new.appt_id is null then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.appt_id
        from
            dual;

    end if;

    if inserting then
        :new.created := localtimestamp;
      -- :new.created_by := nvl(wwv_flow.g_user,user);
        :new.updated := localtimestamp;
       --:new.updated_by := nvl(wwv_flow.g_user,user);
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
       --:new.updated_by := nvl(wwv_flow.g_user,user);
    end if;
end;
/

alter trigger xxventuri.biu_eba_sales_crm_appointments enable;


-- sqlcl_snapshot {"hash":"6ac75ba7f2ec8867d99e2825aef81be08368c0ff","type":"TRIGGER","name":"BIU_EBA_SALES_CRM_APPOINTMENTS","schemaName":"XXVENTURI","sxml":""}