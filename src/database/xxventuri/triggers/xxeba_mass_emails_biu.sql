create or replace editionable trigger xxventuri.xxeba_mass_emails_biu before
    insert or update on xxventuri.xxeba_mass_emails_t
    for each row
declare begin
    if
        inserting
        and :new.mass_email_id is null
    then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.mass_email_id
        from
            dual;

    end if;

    if inserting then
        :new.created_date := localtimestamp;
        :new.created_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated_date := localtimestamp;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.status := 'Y';
    elsif updating then
        :new.updated_date := localtimestamp;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
    end if;

end xxeba_mass_emails_biu;
/

alter trigger xxventuri.xxeba_mass_emails_biu enable;


-- sqlcl_snapshot {"hash":"07bc47c7c40761588644e2cc2ee633fe8a77a104","type":"TRIGGER","name":"XXEBA_MASS_EMAILS_BIU","schemaName":"XXVENTURI","sxml":""}