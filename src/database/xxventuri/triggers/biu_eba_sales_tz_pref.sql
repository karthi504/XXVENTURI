create or replace editionable trigger xxventuri.biu_eba_sales_tz_pref before
    insert or update on xxventuri.eba_sales_tz_pref
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
        :new.created := localtimestamp;
        :new.created_by := nvl(wwv_flow.g_user, user);
        :new.updated := localtimestamp;
        :new.updated_by := nvl(wwv_flow.g_user, user);
        :new.row_version_number := 1;
    elsif updating then
        :new.row_version_number := nvl(:old.row_version_number,
                                       1) + 1;
    end if;

    if inserting
    or updating then
        :new.updated := localtimestamp;
        :new.updated_by := nvl(wwv_flow.g_user, user);
    end if;

    if :new.timezone_preference is null then
        :new.timezone_preference := 'UTC';
    end if;

end;
/

alter trigger xxventuri.biu_eba_sales_tz_pref enable;


-- sqlcl_snapshot {"hash":"b98a0bdc9edfe7e35ab1abed40ee84d635eb915b","type":"TRIGGER","name":"BIU_EBA_SALES_TZ_PREF","schemaName":"XXVENTURI","sxml":""}