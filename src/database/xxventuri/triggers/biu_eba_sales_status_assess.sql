create or replace editionable trigger xxventuri.biu_eba_sales_status_assess before
    insert or update on xxventuri.eba_sales_status_assessments
    for each row
begin
    if inserting then
        if :new.id is null then
            select
                to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
            into :new.id
            from
                dual;

        end if;

        :new.created := localtimestamp;
        :new.created_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated := localtimestamp;
        :new.row_version_number := 1;
    end if;

    if updating then
        :new.updated := localtimestamp;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.row_version_number := nvl(:old.row_version_number,
                                       1) + 1;
    end if;

end;
/

alter trigger xxventuri.biu_eba_sales_status_assess enable;


-- sqlcl_snapshot {"hash":"0c11be9a7d3e3c594fdddcf387a5ac0ef1351bf0","type":"TRIGGER","name":"BIU_EBA_SALES_STATUS_ASSESS","schemaName":"XXVENTURI","sxml":""}