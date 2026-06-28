create or replace editionable trigger xxventuri.xxeba_sales_leave_requests_aiu after
    insert or update on xxventuri.xxeba_sales_leave_requests_t
    for each row
declare begin
    insert into xxeba_sales_leave_request_hist (
        leave_request_id,
        leave_type_id,
        sales_rep_id,
        from_date,
        to_date,
        from_period,
        to_period,
        no_of_days,
        contact_number,
        contact_address,
        leave_reason,
        leave_status,
        approved_by,
        approved_date,
        status,
        created_by,
        creation_date,
        updated_by,
        update_date
    ) values ( :new.leave_request_id,
               :new.leave_type_id,
               :new.sales_rep_id,
               :new.from_date,
               :new.to_date,
               :new.from_period,
               :new.to_period,
               :new.no_of_days,
               :new.contact_number,
               :new.contact_address,
               :new.leave_reason,
               :new.leave_status,
               :new.approved_by,
               :new.approved_date,
               :new.status,
               nvl(
                   v('APP_USER'),
                   user
               ),
               localtimestamp,
               nvl(
                   v('APP_USER'),
                   user
               ),
               localtimestamp );

end;
/

alter trigger xxventuri.xxeba_sales_leave_requests_aiu enable;


-- sqlcl_snapshot {"hash":"17f5f933a0abbe655bac32bf0249c3ce5be8b1a1","type":"TRIGGER","name":"XXEBA_SALES_LEAVE_REQUESTS_AIU","schemaName":"XXVENTURI","sxml":""}