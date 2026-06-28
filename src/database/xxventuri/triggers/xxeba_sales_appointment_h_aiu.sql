create or replace editionable trigger xxventuri.xxeba_sales_appointment_h_aiu after
    insert or update on xxventuri.xxeba_sales_appointment
    for each row
begin
    insert into xxeba_sales_appointment_hist (
        appointment_id,
        row_version_number,
        customer_id,
        appointment_type,
        appointment_date,
        contact_address,
        appointment_purpose,
        contact_person,
        contact_location,
        comments,
        lead_id,
        opportunity_id,
        account,
        source,
        appointment_status,
        status_comments,
        contact_id,
        contact_person_id,
        contact_location_id,
        schedule_upto,
        schedule_reference,
        salesreps_id,
        customer_detail_id
    ) values ( :new.appointment_id,
               :new.row_version_number,
               :new.customer_id,
               :new.appointment_type,
               :new.appointment_date,
               :new.contact_address,
               :new.appointment_purpose,
               :new.contact_person,
               :new.contact_location,
               :new.comments,
               :new.lead_id,
               :new.opportunity_id,
               :new.account,
               :new.source,
               :new.appointment_status,
               :new.status_comments,
               :new.contact_id,
               :new.contact_person_id,
               :new.contact_location_id,
               :new.schedule_upto,
               :new.schedule_reference,
               :new.salesreps_id,
               :new.customer_detail_id );

end;
/

alter trigger xxventuri.xxeba_sales_appointment_h_aiu enable;


-- sqlcl_snapshot {"hash":"2a1176790ffd6a4f759512a2d8ae9d9678cf1711","type":"TRIGGER","name":"XXEBA_SALES_APPOINTMENT_H_AIU","schemaName":"XXVENTURI","sxml":""}