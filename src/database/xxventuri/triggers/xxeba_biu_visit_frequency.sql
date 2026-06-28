create or replace editionable trigger xxventuri.xxeba_biu_visit_frequency before
    insert or update on xxventuri.xxeba_sales_visit_frequency
    for each row
declare begin
    if
        inserting
        and :new.id is null
    then
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
        :new.status := 'Y';
    elsif updating then
        :new.updated := localtimestamp;
        :new.updated_by := nvl(wwv_flow.g_user, user);
    end if;

end;
/

alter trigger xxventuri.xxeba_biu_visit_frequency enable;


-- sqlcl_snapshot {"hash":"9687886e5d0c56fe926b2cb05ac88992ca818fc0","type":"TRIGGER","name":"XXEBA_BIU_VISIT_FREQUENCY","schemaName":"XXVENTURI","sxml":""}