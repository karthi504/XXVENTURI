create or replace editionable trigger xxventuri.eba_test_user_biu before
    insert or update on xxventuri.eba_test_user_t
    for each row
begin
    if inserting then
        :new.testuser_id := eba_test_user_seq.nextval;
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

alter trigger xxventuri.eba_test_user_biu enable;


-- sqlcl_snapshot {"hash":"5e3f29a993455cdd8106126c6f6ce8ce178e88bf","type":"TRIGGER","name":"EBA_TEST_USER_BIU","schemaName":"XXVENTURI","sxml":""}