create or replace editionable trigger xxventuri.biu_eba_sales_currencies before
    insert or update on xxventuri.eba_sales_currencies
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

    :new.currency_code := upper(:new.currency_code);
end;
/

alter trigger xxventuri.biu_eba_sales_currencies enable;


-- sqlcl_snapshot {"hash":"ce41b1c4ed99603ef201099b666227a5aa274916","type":"TRIGGER","name":"BIU_EBA_SALES_CURRENCIES","schemaName":"XXVENTURI","sxml":""}