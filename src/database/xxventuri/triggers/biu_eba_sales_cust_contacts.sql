create or replace editionable trigger xxventuri.biu_eba_sales_cust_contacts before
    insert or update on xxventuri.eba_sales_customer_contacts
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := to_number ( sys_guid(),
            'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' );
        end if;

        :new.row_version_number := 1;
    --:new.row_key := eba_sales_fw.compress_int(eba_sales_rowkey_seq.nextval);
        :new.row_key := to_char(lpad(eba_sales_customer_contact_seq.nextval, 5, '0'));

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
        p_content_type => 'CONTACT',
        p_content_id   => :new.id
    );

end;
/

alter trigger xxventuri.biu_eba_sales_cust_contacts enable;


-- sqlcl_snapshot {"hash":"055ce9d1921747e3f6c5583b854ede6fe9c5d3eb","type":"TRIGGER","name":"BIU_EBA_SALES_CUST_CONTACTS","schemaName":"XXVENTURI","sxml":""}