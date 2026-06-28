create or replace editionable trigger xxventuri.xxeba_sales_crm_appt_h_aiu after
    insert or update on xxventuri.xxeba_sales_crm_appointments
    for each row
begin
    insert into xxeba_sales_crm_appointments_h (
        appt_id,
        row_version_number,
        customer_id,
        contact_person_id,
        contact_location_id,
        appointment_type,
        appointment_date,
        appointment_purpose,
        comments,
        appointment_status,
        status_comments,
        salesrep_id,
        appointment_source,
        visited_on,
        limit_existed,
        negotiation_id
    ) values ( :new.appt_id,
               :new.row_version_number,
               :new.customer_id,
               :new.contact_person_id,
               :new.contact_location_id,
               :new.appointment_type,
               :new.appointment_date,
               :new.appointment_purpose,
               :new.comments,
               :new.appointment_status,
               :new.status_comments,
               :new.salesrep_id,
               :new.appointment_source,
               :new.visited_on,
               :new.limit_existed,
               :new.negotiation_id );

end;
/

alter trigger xxventuri.xxeba_sales_crm_appt_h_aiu enable;


-- sqlcl_snapshot {"hash":"2d0e8b729195f0de979add943887346b111a0739","type":"TRIGGER","name":"XXEBA_SALES_CRM_APPT_H_AIU","schemaName":"XXVENTURI","sxml":""}