create or replace editionable trigger xxventuri.biu_eba_sales_account_standing before
    insert or update on xxventuri.eba_sales_account_standing
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

alter trigger xxventuri.biu_eba_sales_account_standing enable;


-- sqlcl_snapshot {"hash":"dea604e5e8dd698b65690a5edbe43846a10df11d","type":"TRIGGER","name":"BIU_EBA_SALES_ACCOUNT_STANDING","schemaName":"XXVENTURI","sxml":""}