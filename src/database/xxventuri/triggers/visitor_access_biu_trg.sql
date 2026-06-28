create or replace editionable trigger xxventuri.visitor_access_biu_trg before
    insert or update on xxventuri.visitor_access_t
    for each row
begin

    -- Primary Key generation

    if inserting then
        if :new.visitor_id is null then
            :new.visitor_id := visitor_access_seq.nextval;
        end if;

        :new.created_on := sysdate;
        :new.created_by := nvl(
            v('APP_USER'),
            user
        );
    end if;
 
    -- Update audit columns

    if updating then
        :new.updated_on := sysdate;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
    end if;

end;
/

alter trigger xxventuri.visitor_access_biu_trg enable;


-- sqlcl_snapshot {"hash":"ea27cff8c65f0b27cf1e9d4af4e21eef3f9998b2","type":"TRIGGER","name":"VISITOR_ACCESS_BIU_TRG","schemaName":"XXVENTURI","sxml":""}