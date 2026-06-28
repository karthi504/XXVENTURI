create or replace editionable trigger xxventuri.xxeba_sales_effi_details_biu before
    insert or update on xxventuri.xxeba_sales_effi_details_t
    for each row
declare begin
    if
        inserting
        and :new.details_id is null
    then
        select
            xxeba_sales_effi_details_seq.nextval
        into :new.details_id
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

alter trigger xxventuri.xxeba_sales_effi_details_biu enable;


-- sqlcl_snapshot {"hash":"7225420bf074a4ce90aacd9a5b71bd153b1eaa24","type":"TRIGGER","name":"XXEBA_SALES_EFFI_DETAILS_BIU","schemaName":"XXVENTURI","sxml":""}