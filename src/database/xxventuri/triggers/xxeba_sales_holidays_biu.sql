create or replace editionable trigger xxventuri.xxeba_sales_holidays_biu before
    insert or update on xxventuri.xxeba_sales_holidays_t
    for each row
begin
    if
        inserting
        and :new.holidays_id is null
    then
        select
            xxeba_sales_holidays_seq.nextval
        into :new.holidays_id
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
    elsif updating then
        null;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.update_date := localtimestamp;
    end if;

end;
/

alter trigger xxventuri.xxeba_sales_holidays_biu enable;


-- sqlcl_snapshot {"hash":"d2dfbb2c6e7c266b3c10ca131bd5e823fea6ea93","type":"TRIGGER","name":"XXEBA_SALES_HOLIDAYS_BIU","schemaName":"XXVENTURI","sxml":""}