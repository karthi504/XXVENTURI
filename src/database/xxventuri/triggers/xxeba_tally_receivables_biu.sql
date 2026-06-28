create or replace editionable trigger xxventuri.xxeba_tally_receivables_biu before
    insert or update on xxventuri.xxeba_tally_receivables_t
    for each row
declare begin
    if inserting then
        :new.created_by := nvl(
            v('APP_USER'),
            user
        );
        :new.created_date := sysdate;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated_date := sysdate;
        :new.status := 'Y';
    end if;

    if updating then
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.updated_date := sysdate;
    end if;

end;
/

alter trigger xxventuri.xxeba_tally_receivables_biu enable;


-- sqlcl_snapshot {"hash":"1d87df2daf7d6e0fbbd56a48908884650963078c","type":"TRIGGER","name":"XXEBA_TALLY_RECEIVABLES_BIU","schemaName":"XXVENTURI","sxml":""}