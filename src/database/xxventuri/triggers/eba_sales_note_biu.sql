create or replace editionable trigger xxventuri.eba_sales_note_biu before
    insert or update on xxventuri.eba_sales_notifications
    for each row
begin
    if
        inserting
        and :new.id is null
    then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.id
        from
            dual;

    end if;

    if inserting then
        :new.created_by := nvl(
            v('APP_USER'),
            user
        );
        :new.created := localtimestamp;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated := localtimestamp;
        :new.row_version_number := 1;
    end if;

    if updating then
        :new.row_version_number := nvl(:old.row_version_number,
                                       1) + 1;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated := localtimestamp;
    end if;

    if :new.notification_type is null then
        :new.notification_type := 'MANUAL';
    end if;

end;
/

alter trigger xxventuri.eba_sales_note_biu enable;


-- sqlcl_snapshot {"hash":"e41fbab898cfeaa60fd4262f586036236352c544","type":"TRIGGER","name":"EBA_SALES_NOTE_BIU","schemaName":"XXVENTURI","sxml":""}