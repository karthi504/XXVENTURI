create or replace editionable trigger xxventuri.xxeba_sales_banks_list_biu before
    insert or update on xxventuri.xxeba_sales_banks_list
    for each row
declare begin
    if
        inserting
        and :new.bank_id is null
    then
        select
            xxeba_sales_banks_seq.nextval
        into :new.bank_id
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

alter trigger xxventuri.xxeba_sales_banks_list_biu enable;


-- sqlcl_snapshot {"hash":"bf2d89c7b805063e742feee8d560f50990821325","type":"TRIGGER","name":"XXEBA_SALES_BANKS_LIST_BIU","schemaName":"XXVENTURI","sxml":""}