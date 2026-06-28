create or replace editionable trigger xxventuri.biu_xxeba_sales_brands before
    insert or update on xxventuri.xxeba_sales_brands
    for each row
begin
    if
        inserting
        and :new.brand_id is null
    then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.brand_id
        from
            dual;

    end if;

    if inserting then
        :new.created_by := nvl(
            v('APP_USER'),
            user
        );
        :new.created := localtimestamp;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated := localtimestamp;
    end if;

    if updating then
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated := localtimestamp;
    end if;

end;
/

alter trigger xxventuri.biu_xxeba_sales_brands enable;


-- sqlcl_snapshot {"hash":"d85663dae1d704f7216939973c9b42c5947e6e9a","type":"TRIGGER","name":"BIU_XXEBA_SALES_BRANDS","schemaName":"XXVENTURI","sxml":""}