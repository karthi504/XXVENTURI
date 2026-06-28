create or replace editionable trigger xxventuri.biu_eba_eba_sales_act_compet before
    insert or update on xxventuri.eba_sales_act_competition
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

alter trigger xxventuri.biu_eba_eba_sales_act_compet enable;


-- sqlcl_snapshot {"hash":"350fe2757242029d0b990675abe5da9e1df2ad1e","type":"TRIGGER","name":"BIU_EBA_EBA_SALES_ACT_COMPET","schemaName":"XXVENTURI","sxml":""}