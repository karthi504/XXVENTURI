create or replace editionable trigger xxventuri.xxeba_sales_units_biu before
    insert or update on xxventuri.xxeba_sales_units
    for each row
declare begin
    if
        inserting
        and :new.unit_id is null
    then
        select
            xxeba_sales_units_sql.nextval
        into :new.unit_id
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

alter trigger xxventuri.xxeba_sales_units_biu enable;


-- sqlcl_snapshot {"hash":"2162b33d0576b82ce642844d4ffa8ace9903053c","type":"TRIGGER","name":"XXEBA_SALES_UNITS_BIU","schemaName":"XXVENTURI","sxml":""}