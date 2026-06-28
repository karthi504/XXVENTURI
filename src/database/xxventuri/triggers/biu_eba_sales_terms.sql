create or replace editionable trigger xxventuri.biu_eba_sales_terms before
    insert or update on xxventuri.eba_sales_terms
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
    end if;

    if updating then
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated := localtimestamp;
    end if;

end;
/

alter trigger xxventuri.biu_eba_sales_terms enable;


-- sqlcl_snapshot {"hash":"e356a39eb8e1c8357f736b83a9c7a11fdc3c9943","type":"TRIGGER","name":"BIU_EBA_SALES_TERMS","schemaName":"XXVENTURI","sxml":""}