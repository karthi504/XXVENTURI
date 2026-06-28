create or replace editionable trigger xxventuri.biu_xxeba_sales_attendance before
    insert or update on xxventuri.xxeba_sales_attendance_t
    for each row
begin
    if :new.att_id is null then
        select
            xxeba_sales_attendance_seq.nextval
        into :new.att_id
        from
            dual;

    end if;

    if inserting then
        :new.created_date := localtimestamp;
        :new.updated_date := localtimestamp;
        :new.location_update := 'N';
       --:NEW.CREATED_BY := NVL(V('APP_USER'),USER);
       --:NEW.UPDATED_BY := NVL(V('APP_USER'),USER);
    end if;

    if inserting
    or updating then
        :new.updated_date := localtimestamp;
       --:NEW.UPDATED_BY := NVL(V('APP_USER'),USER);
    end if;
end;
/

alter trigger xxventuri.biu_xxeba_sales_attendance enable;


-- sqlcl_snapshot {"hash":"c33fe6551aed3697adfa92c63191c429a5f483cc","type":"TRIGGER","name":"BIU_XXEBA_SALES_ATTENDANCE","schemaName":"XXVENTURI","sxml":""}