create or replace editionable trigger xxventuri.biu_eba_sales_comp_threats before
    insert or update on xxventuri.eba_sales_competitor_threats
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

alter trigger xxventuri.biu_eba_sales_comp_threats enable;


-- sqlcl_snapshot {"hash":"b2b2548e01a825cc77bbb21a945596c8da9e6131","type":"TRIGGER","name":"BIU_EBA_SALES_COMP_THREATS","schemaName":"XXVENTURI","sxml":""}