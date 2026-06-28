create or replace editionable trigger xxventuri.xxeba_sales_leave_requests_biu before
    insert or update on xxventuri.xxeba_sales_leave_requests_t
    for each row
declare begin
    if
        inserting
        and :new.leave_request_id is null
    then
        select
            xxeba_sales_leave_requests_seq.nextval
        into :new.leave_request_id
        from
            dual;

    end if;

    if inserting then
        :new.status := 'Y';
        :new.leave_status := 'S';
        :new.created_by := nvl(
            v('APP_USER'),
            user
        );
        :new.creation_date := localtimestamp;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.update_date := localtimestamp;
    end if;

    if updating then
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.update_date := localtimestamp;
    end if;

end;
/

alter trigger xxventuri.xxeba_sales_leave_requests_biu enable;


-- sqlcl_snapshot {"hash":"fa7546086740bee37084b0a38b560f76c5dabcd6","type":"TRIGGER","name":"XXEBA_SALES_LEAVE_REQUESTS_BIU","schemaName":"XXVENTURI","sxml":""}