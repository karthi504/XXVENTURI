create or replace editionable trigger xxventuri.biu_eba_sales_terr before
    insert or update on xxventuri.eba_sales_territories
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := to_number ( sys_guid(),
            'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' );
        end if;

        :new.row_version_number := 1;
    --:new.row_key := eba_sales_fw.compress_int(eba_sales_rowkey_seq.nextval);
        :new.row_key := to_char(lpad(eba_sales_territories_seq.nextval, 5, '0'));

        :new.created_by := nvl(apex_application.g_user, user);
        :new.created := localtimestamp;
        :new.updated_by := nvl(apex_application.g_user, user);
        :new.updated := localtimestamp;
    elsif updating then
        :new.updated_by := nvl(apex_application.g_user, user);
        :new.updated := localtimestamp;
        :new.row_version_number := nvl(:old.row_version_number,
                                       1) + 1;
    end if;

    if :new.tags is not null then
        :new.tags := eba_sales_fw.tags_cleaner(:new.tags);
    end if;

    eba_sales_fw.tag_sync(
        p_new_tags     => :new.tags,
        p_old_tags     => :old.tags,
        p_content_type => 'TERRITORY',
        p_content_id   => :new.id
    );

end;
/

alter trigger xxventuri.biu_eba_sales_terr enable;


-- sqlcl_snapshot {"hash":"376ff85cbfc4b911d6530357b0ec3cceb3d52bea","type":"TRIGGER","name":"BIU_EBA_SALES_TERR","schemaName":"XXVENTURI","sxml":""}