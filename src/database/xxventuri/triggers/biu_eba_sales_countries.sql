create or replace editionable trigger xxventuri.biu_eba_sales_countries before
    insert or update on xxventuri.eba_sales_countries
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
        :new.row_version_number := 1;
    end if;
    if updating then
        :new.row_version_number := nvl(:old.row_version_number,
                                       1) + 1;
    end if;

end;
/

alter trigger xxventuri.biu_eba_sales_countries enable;


-- sqlcl_snapshot {"hash":"c26f7402cea44447d6160379c055da33fa0c7941","type":"TRIGGER","name":"BIU_EBA_SALES_COUNTRIES","schemaName":"XXVENTURI","sxml":""}