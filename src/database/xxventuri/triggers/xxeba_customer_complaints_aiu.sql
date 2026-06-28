create or replace editionable trigger xxventuri.xxeba_customer_complaints_aiu after
    insert or update on xxventuri.xxeba_customer_complaints_t
    for each row
begin
    insert into customer_complaints_hist (
        complaint_id,
        complaint_number,
        account_id,
        raised_date,
        raised_by,
        contact_number,
        raised_source,
        complaint_type,
        complaint_products,
        complaint_subject,
        complaint_desc,
        assigned_to,
        root_cause,
        corrective_action,
        preventive_action,
        resolved_remarks,
        resolved_by,
        resolved_date,
        verified_remarks,
        verified_by,
        verified_date,
        status,
        created,
        created_by,
        updated,
        updated_by
    ) values ( :new.complaint_id,
               :new.complaint_number,
               :new.account_id,
               :new.raised_date,
               :new.raised_by,
               :new.contact_number,
               :new.raised_source,
               :new.complaint_type,
               :new.complaint_products,
               :new.complaint_subject,
               :new.complaint_desc,
               :new.assigned_to,
               :new.root_cause,
               :new.corrective_action,
               :new.preventive_action,
               :new.resolved_remarks,
               :new.resolved_by,
               :new.resolved_date,
               :new.verified_remarks,
               :new.verified_by,
               :new.verified_date,
               :new.status,
               :new.created,
               :new.created_by,
               :new.updated,
               :new.updated_by );

end;
/

alter trigger xxventuri.xxeba_customer_complaints_aiu enable;


-- sqlcl_snapshot {"hash":"8d3364a4b785285ed692024c6474a83f46db0533","type":"TRIGGER","name":"XXEBA_CUSTOMER_COMPLAINTS_AIU","schemaName":"XXVENTURI","sxml":""}