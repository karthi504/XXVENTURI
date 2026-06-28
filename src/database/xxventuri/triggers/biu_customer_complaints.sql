create or replace editionable trigger xxventuri.biu_customer_complaints before
    insert or update on xxventuri.xxeba_customer_complaints_t
    for each row
declare
    p_number         number;
    v_complaint_code xxeba_customer_complaints_t.complaint_id%type;
begin
    if :new.complaint_id is null then
        v_complaint_code := generate_complaint_id(p_number);
        :new.complaint_id := v_complaint_code;
        :new.complaint_number := p_number;
    end if;

    if inserting then
        :new.created := localtimestamp;
        :new.created_by := nvl(wwv_flow.g_user, user);
        :new.updated := localtimestamp;
        :new.updated_by := nvl(wwv_flow.g_user, user);
        :new.status := 'N';
    end if;

    if inserting
    or updating then
        :new.updated := localtimestamp;
        :new.updated_by := nvl(wwv_flow.g_user, user);
    end if;

end;
/

alter trigger xxventuri.biu_customer_complaints enable;


-- sqlcl_snapshot {"hash":"44b31799ffd1ed10e6951ad93593cfd1fa70e59c","type":"TRIGGER","name":"BIU_CUSTOMER_COMPLAINTS","schemaName":"XXVENTURI","sxml":""}