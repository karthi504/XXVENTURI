create or replace editionable trigger xxventuri.xxeba_stock_codes_biu before
    insert or update on xxventuri.xxeba_stock_codes
    for each row
declare begin
    if
        inserting
        and :new.stock_id is null
    then
        select
            xxeba_stock_codes_seq.nextval
        into :new.stock_id
        from
            dual;

    end if;

    if inserting then
        :new.status := 'Y';
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

alter trigger xxventuri.xxeba_stock_codes_biu enable;


-- sqlcl_snapshot {"hash":"1151658e54fc3de60a4d9150489c56e0fe1c9e98","type":"TRIGGER","name":"XXEBA_STOCK_CODES_BIU","schemaName":"XXVENTURI","sxml":""}