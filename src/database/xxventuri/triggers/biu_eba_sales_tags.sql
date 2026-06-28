create or replace editionable trigger xxventuri.biu_eba_sales_tags before
    insert or update on xxventuri.eba_sales_tags
    for each row
begin
    :new.tag := upper(:new.tag);
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

alter trigger xxventuri.biu_eba_sales_tags enable;


-- sqlcl_snapshot {"hash":"3f9e18b28c8298a6d581f8bf0499aab635f6d83f","type":"TRIGGER","name":"BIU_EBA_SALES_TAGS","schemaName":"XXVENTURI","sxml":""}