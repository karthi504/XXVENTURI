create or replace editionable trigger xxventuri.xxeba_sales_pers_trgt_h_aiu after
    insert or update on xxventuri.xxeba_sales_person_target
    for each row
begin
    insert into xxeba_sales_person_target_hist (
        target_id,
        sales_rep_id,
        target_period,
        target_amount,
        currency_type
    ) values ( :new.target_id,
               :new.sales_rep_id,
               :new.target_period,
               :new.target_amount,
               :new.currency_type );

end;
/

alter trigger xxventuri.xxeba_sales_pers_trgt_h_aiu enable;


-- sqlcl_snapshot {"hash":"49a945155013d3c4f4a04d783cbd551dfd8e4603","type":"TRIGGER","name":"XXEBA_SALES_PERS_TRGT_H_AIU","schemaName":"XXVENTURI","sxml":""}