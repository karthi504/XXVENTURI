create or replace editionable trigger xxventuri.xxeba_email_templates_biu before
    insert or update on xxventuri.xxeba_email_templates_t
    for each row
declare begin
    if
        inserting
        and :new.template_id is null
    then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.template_id
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

end xxeba_email_templates_biu;
/

alter trigger xxventuri.xxeba_email_templates_biu enable;


-- sqlcl_snapshot {"hash":"d3090e895b8ce13634540ef4c27550cc5194d8ff","type":"TRIGGER","name":"XXEBA_EMAIL_TEMPLATES_BIU","schemaName":"XXVENTURI","sxml":""}