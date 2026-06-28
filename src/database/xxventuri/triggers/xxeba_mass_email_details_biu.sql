create or replace editionable trigger xxventuri.xxeba_mass_email_details_biu before
    insert or update on xxventuri.xxeba_mass_email_details_t
    for each row
declare begin
    if
        inserting
        and :new.mass_email_detail_id is null
    then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.mass_email_detail_id
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

end xxeba_mass_email_details_biu;
/

alter trigger xxventuri.xxeba_mass_email_details_biu enable;


-- sqlcl_snapshot {"hash":"7d3bfeb5ea8bc315c7a87337cc7c3c676203cf23","type":"TRIGGER","name":"XXEBA_MASS_EMAIL_DETAILS_BIU","schemaName":"XXVENTURI","sxml":""}