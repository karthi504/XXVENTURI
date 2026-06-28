create or replace editionable trigger xxventuri.biu_eba_sales_territory_acl before
    insert or update on xxventuri.eba_sales_territory_acl
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
        :new.updated := localtimestamp;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
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

alter trigger xxventuri.biu_eba_sales_territory_acl enable;


-- sqlcl_snapshot {"hash":"2bcf8f38b42c4e77c5ab413154d8844df30e5aa4","type":"TRIGGER","name":"BIU_EBA_SALES_TERRITORY_ACL","schemaName":"XXVENTURI","sxml":""}