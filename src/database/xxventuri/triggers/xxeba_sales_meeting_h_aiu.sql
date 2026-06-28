create or replace editionable trigger xxventuri.xxeba_sales_meeting_h_aiu after
    insert or update on xxventuri.xxeba_sales_meeting_schedule
    for each row
begin
    insert into xxeba_sales_meeting_hist (
        schedule_id,
        appointment_id,
        schedule_type,
        schedule_sequence
    ) values ( :new.schedule_id,
               :new.appointment_id,
               :new.schedule_type,
               :new.schedule_sequence );

end;
/

alter trigger xxventuri.xxeba_sales_meeting_h_aiu enable;


-- sqlcl_snapshot {"hash":"9ee0b070a1c4d654464bf7b9833b21d3f837ad5a","type":"TRIGGER","name":"XXEBA_SALES_MEETING_H_AIU","schemaName":"XXVENTURI","sxml":""}