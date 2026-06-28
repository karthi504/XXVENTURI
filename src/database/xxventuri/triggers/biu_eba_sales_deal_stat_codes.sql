create or replace editionable trigger xxventuri.biu_eba_sales_deal_stat_codes before
    insert or update on xxventuri.eba_sales_deal_status_codes
    for each row
begin
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
        :new.created_by := nvl(
            v('APP_USER'),
            user
        );
        :new.created := localtimestamp;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated := localtimestamp;
        :new.row_version_number := 1;
    end if;

    if updating then
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated := localtimestamp;
        :new.row_version_number := nvl(:old.row_version_number,
                                       1) + 1;
    end if;

end;
/

alter trigger xxventuri.biu_eba_sales_deal_stat_codes enable;


-- sqlcl_snapshot {"hash":"dc6beec32a3433a2d8bee7f4cc43fa108348927c","type":"TRIGGER","name":"BIU_EBA_SALES_DEAL_STAT_CODES","schemaName":"XXVENTURI","sxml":""}