create or replace editionable trigger xxventuri.xxeba_sales_cities_biu before
    insert or update on xxventuri.xxeba_sales_cities_t
    for each row
declare begin
    if
        inserting
        and :new.city_id is null
    then
        select
            xxeba_sales_cities_seq.nextval
        into :new.city_id
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

alter trigger xxventuri.xxeba_sales_cities_biu enable;


-- sqlcl_snapshot {"hash":"0f08dcc8961338fb73fc8844b326321c09e95f44","type":"TRIGGER","name":"XXEBA_SALES_CITIES_BIU","schemaName":"XXVENTURI","sxml":""}