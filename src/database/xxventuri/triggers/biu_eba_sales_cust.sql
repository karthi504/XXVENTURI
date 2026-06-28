create or replace editionable trigger xxventuri.biu_eba_sales_cust before
    insert or update on xxventuri.eba_sales_customers
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := to_number ( sys_guid(),
            'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' );
        end if;

        :new.row_version_number := 1;
   -- :new.row_key := eba_sales_fw.compress_int(eba_sales_rowkey_seq.nextval);
        :new.row_key := to_char(lpad(eba_sales_customers_seq.nextval, 5, '0'));

        :new.created_by := nvl(apex_application.g_user, user);
        :new.created := localtimestamp;
        :new.updated_by := nvl(apex_application.g_user, user);
        :new.updated := localtimestamp;
        :new.status := 'Y';
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
        p_content_type => 'ACCOUNT',
        p_content_id   => :new.id
    );

end;
/

alter trigger xxventuri.biu_eba_sales_cust enable;


-- sqlcl_snapshot {"hash":"e41370c80a20ada889ea6fa8e8a4060500cf79ca","type":"TRIGGER","name":"BIU_EBA_SALES_CUST","schemaName":"XXVENTURI","sxml":""}