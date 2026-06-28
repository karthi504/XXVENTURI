create or replace editionable trigger xxventuri.biu_eba_sales_fin_assessments before
    insert or update on xxventuri.eba_sales_fin_assessments
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

alter trigger xxventuri.biu_eba_sales_fin_assessments enable;


-- sqlcl_snapshot {"hash":"6fbce328f5cd9bc129bdb67603ef3f19b567941b","type":"TRIGGER","name":"BIU_EBA_SALES_FIN_ASSESSMENTS","schemaName":"XXVENTURI","sxml":""}