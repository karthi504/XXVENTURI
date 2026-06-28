create or replace editionable trigger xxventuri.biu_eba_sales_products before
    insert or update on xxventuri.eba_sales_products
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

        :new.row_version_number := 1;
        :new.status := 'Y';
    --:new.row_key := eba_sales_fw.compress_int(eba_sales_rowkey_seq.nextval);
        :new.row_key := to_char(lpad(eba_sales_products_seq.nextval, 5, '0'));

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
        p_content_type => 'PRODUCT',
        p_content_id   => :new.id
    );

end;
/

alter trigger xxventuri.biu_eba_sales_products enable;


-- sqlcl_snapshot {"hash":"10f656f52fb627481119afb79fc78f72ecac3726","type":"TRIGGER","name":"BIU_EBA_SALES_PRODUCTS","schemaName":"XXVENTURI","sxml":""}