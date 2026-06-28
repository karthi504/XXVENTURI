create or replace editionable trigger xxventuri.xxeba_sales_efficiency_biu before
    insert or update on xxventuri.xxeba_sales_efficiency_t
    for each row
declare begin
    if
        inserting
        and :new.efficiency_id is null
    then
        select
            xxeba_sales_efficiency_seq.nextval
        into :new.efficiency_id
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

alter trigger xxventuri.xxeba_sales_efficiency_biu enable;


-- sqlcl_snapshot {"hash":"31fe514e3d0e2ff1d7cf0529635e2f8c61083ab8","type":"TRIGGER","name":"XXEBA_SALES_EFFICIENCY_BIU","schemaName":"XXVENTURI","sxml":""}