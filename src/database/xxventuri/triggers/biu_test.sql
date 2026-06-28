create or replace editionable trigger xxventuri.biu_test before
    insert or update on xxventuri.test
    for each row
begin
    if inserting then
        :new.created_date := localtimestamp;
        :new.created_date_local := localtimestamp;
    end if;
end;
/

alter trigger xxventuri.biu_test enable;


-- sqlcl_snapshot {"hash":"fda4ed2c5d47ce3a396b8ae2579d99c1e8b41b0f","type":"TRIGGER","name":"BIU_TEST","schemaName":"XXVENTURI","sxml":""}