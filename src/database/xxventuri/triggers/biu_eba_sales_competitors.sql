create or replace editionable trigger xxventuri.biu_eba_sales_competitors before
    insert or update on xxventuri.eba_sales_competitors
    for each row
begin
    if :new.tags is not null then
        :new.tags := eba_sales_fw.tags_cleaner(:new.tags);
    end if;

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

    eba_sales_fw.tag_sync(
        p_new_tags     => :new.tags,
        p_old_tags     => :old.tags,
        p_content_type => 'COMPETITOR',
        p_content_id   => :new.id
    );

end;
/

alter trigger xxventuri.biu_eba_sales_competitors enable;


-- sqlcl_snapshot {"hash":"6d494630cd7616002b3c4e6c2aa579b0e692306a","type":"TRIGGER","name":"BIU_EBA_SALES_COMPETITORS","schemaName":"XXVENTURI","sxml":""}