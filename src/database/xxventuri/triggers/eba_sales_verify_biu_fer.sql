create or replace editionable trigger xxventuri.eba_sales_verify_biu_fer before
    insert or update on xxventuri.eba_sales_verifications
    for each row
begin
    if :new.id is null then
        :new.id := eba_sales_acl_api.gen_id();
    end if;

    if inserting then
        :new.created := localtimestamp;
        :new.created_by := nvl(apex_application.g_user, user);
        :new.verification_status := 'Validated';
    end if;

    :new.verified_by := lower(:new.verified_by);
    :new.verification_status := 'Validated';
    :new.updated := localtimestamp;
    :new.updated_by := nvl(apex_application.g_user, user);
end;
/

alter trigger xxventuri.eba_sales_verify_biu_fer enable;


-- sqlcl_snapshot {"hash":"1bd39d8af5eab24543bb534d39cbb57bf7396b3d","type":"TRIGGER","name":"EBA_SALES_VERIFY_BIU_FER","schemaName":"XXVENTURI","sxml":""}