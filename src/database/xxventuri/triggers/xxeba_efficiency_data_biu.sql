create or replace editionable trigger xxventuri.xxeba_efficiency_data_biu before
    insert or update on xxventuri.xxeba_efficiency_data_t
    for each row
declare begin
    if
        inserting
        and :new.efficiency_id is null
    then
        select
            xxeba_efficiency_data_seq.nextval
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
        :new.created_date := localtimestamp;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated_date := localtimestamp;
    end if;

    if updating then
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated_date := localtimestamp;
    end if;

end;
/

alter trigger xxventuri.xxeba_efficiency_data_biu enable;


-- sqlcl_snapshot {"hash":"04cb7a42f62d4c7bd4b250b45779ecb08e31836e","type":"TRIGGER","name":"XXEBA_EFFICIENCY_DATA_BIU","schemaName":"XXVENTURI","sxml":""}