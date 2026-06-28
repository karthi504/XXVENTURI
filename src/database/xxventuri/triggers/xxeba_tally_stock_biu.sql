create or replace editionable trigger xxventuri.xxeba_tally_stock_biu before
    insert or update on xxventuri.xxeba_tally_stock_t
    for each row
declare begin
    if inserting then
        :new.created_by := nvl(
            v('APP_USER'),
            user
        );
        :new.created_date := sysdate;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated_date := sysdate;
        :new.status := 'Y';
    end if;

    if updating then
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated_date := sysdate;
    end if;

end;
/

alter trigger xxventuri.xxeba_tally_stock_biu enable;


-- sqlcl_snapshot {"hash":"f5b34f125dc53291533e177becd09dade1cf338e","type":"TRIGGER","name":"XXEBA_TALLY_STOCK_BIU","schemaName":"XXVENTURI","sxml":""}