create or replace editionable trigger xxventuri.xxeba_credit_terms_aiu after
    insert or update on xxventuri.xxeba_sales_customer_details
    for each row
begin
    if :old.details_id is not null then
        insert into xxeba_credit_terms_hist (
            details_id,
            customer_id,
            mode_of_delivery,
            credit_days,
            credit_limit,
            credit_currency,
            grace_days,
            enquiry_customer,
            enquiry_supplier,
            enquiry_competitor,
            enquiry_employee,
            introduced_by,
            verified_by,
            expected_business,
            expected_business_currency,
            credit_terms_rec,
            credit_limit_rec,
            credit_limit_currency,
            grace_days_rec,
            visit_frequency_rec,
            assigned_to,
            comments,
            recommended_by,
            status,
            created_by,
            creation_date,
            updated_by,
            update_date,
            schedule_frequency
        ) values ( :old.details_id,
                   :old.customer_id,
                   :old.mode_of_delivery,
                   :old.credit_days,
                   :old.credit_limit,
                   :old.credit_currency,
                   :old.grace_days,
                   :old.enquiry_customer,
                   :old.enquiry_supplier,
                   :old.enquiry_competitor,
                   :old.enquiry_employee,
                   :old.introduced_by,
                   :old.verified_by,
                   :old.expected_business,
                   :old.expected_business_currency,
                   :old.credit_terms_rec,
                   :old.credit_limit_rec,
                   :old.credit_limit_currency,
                   :old.grace_days_rec,
                   :old.visit_frequency_rec,
                   :old.assigned_to,
                   :old.comments,
                   :old.recommended_by,
                   :old.status,
                   :old.created_by,
                   :old.creation_date,
                   :old.updated_by,
                   :old.update_date,
                   :old.schedule_frequency );

    end if;
end;
/

alter trigger xxventuri.xxeba_credit_terms_aiu enable;


-- sqlcl_snapshot {"hash":"c1318451b67fc9f12efcf57708478ed1c3d52073","type":"TRIGGER","name":"XXEBA_CREDIT_TERMS_AIU","schemaName":"XXVENTURI","sxml":""}