create or replace editionable trigger xxventuri.biu_eba_sales_salesrep_roles before
    insert or update on xxventuri.eba_sales_salesrep_roles
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

    if :new.is_sales_rep is null then
        :new.is_sales_rep := 'Y';
    end if;

end;
/

alter trigger xxventuri.biu_eba_sales_salesrep_roles enable;


-- sqlcl_snapshot {"hash":"43e335a28cd8a6cfab15cc2e6285c6272e345f91","type":"TRIGGER","name":"BIU_EBA_SALES_SALESREP_ROLES","schemaName":"XXVENTURI","sxml":""}