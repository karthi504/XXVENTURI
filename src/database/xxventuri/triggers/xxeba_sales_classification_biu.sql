create or replace editionable trigger xxventuri.xxeba_sales_classification_biu before
    insert or update on xxventuri.xxeba_sales_classification
    for each row
declare begin
    if
        inserting
        and :new.class_id is null
    then
        select
            xxeba_sales_classification_seq.nextval
        into :new.class_id
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

alter trigger xxventuri.xxeba_sales_classification_biu enable;


-- sqlcl_snapshot {"hash":"9a586e441582b329a817af5744e650e6681d184b","type":"TRIGGER","name":"XXEBA_SALES_CLASSIFICATION_BIU","schemaName":"XXVENTURI","sxml":""}