create or replace editionable trigger xxventuri.xxeba_tally_invoices_biu before
    insert or update on xxventuri.xxeba_tally_invoices_t
    for each row
declare begin
    if
        inserting
        and :new.invoice_id is null
    then
        select
            xxeba_tally_invoices_seq.nextval
        into :new.invoice_id
        from
            dual;

    end if;

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

alter trigger xxventuri.xxeba_tally_invoices_biu enable;


-- sqlcl_snapshot {"hash":"bd597cdc14807815304fe1f466617de66e0828b7","type":"TRIGGER","name":"XXEBA_TALLY_INVOICES_BIU","schemaName":"XXVENTURI","sxml":""}