create or replace editionable trigger xxventuri.biu_eba_sales_history before
    insert or update on xxventuri.eba_sales_history
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
        :new.change_date := localtimestamp;
        :new.changed_by := nvl(wwv_flow.g_user, user);
        :new.row_version_number := 1;
    elsif updating then
        :new.row_version_number := :new.row_version_number + 1;
    end if;

end;
/

alter trigger xxventuri.biu_eba_sales_history enable;


-- sqlcl_snapshot {"hash":"ddbf4d857a934ed434da3db8e0105b83b6d78423","type":"TRIGGER","name":"BIU_EBA_SALES_HISTORY","schemaName":"XXVENTURI","sxml":""}