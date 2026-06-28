create or replace editionable trigger xxventuri.biu_eba_sales_terr_map before
    insert or update on xxventuri.eba_sales_terr_map
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

end;
/

alter trigger xxventuri.biu_eba_sales_terr_map enable;


-- sqlcl_snapshot {"hash":"1b44d2c7fc78dac35f2bb04ad90a7c6ff9e97827","type":"TRIGGER","name":"BIU_EBA_SALES_TERR_MAP","schemaName":"XXVENTURI","sxml":""}