create or replace editionable trigger xxventuri.xxeba_tally_invoice_biu before
    insert or update on xxventuri.xxeba_tally_invoices_t
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

alter trigger xxventuri.xxeba_tally_invoice_biu enable;


-- sqlcl_snapshot {"hash":"2ff160b1e0d1fd09bdc657bd18f838129a6bd944","type":"TRIGGER","name":"XXEBA_TALLY_INVOICE_BIU","schemaName":"XXVENTURI","sxml":""}