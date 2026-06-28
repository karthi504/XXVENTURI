create or replace editionable trigger xxventuri.biu_eba_sales_lead_st_cds before
    insert or update on xxventuri.eba_sales_lead_status_codes
    for each row
begin
    if
        inserting
        and :new.id is null
    then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.id
        from
            dual;

    end if;

    if inserting then
        :new.row_version_number := 1;
    end if;
    if updating then
        :new.row_version_number := nvl(:old.row_version_number,
                                       1) + 1;
    end if;

end;
/

alter trigger xxventuri.biu_eba_sales_lead_st_cds enable;


-- sqlcl_snapshot {"hash":"9fba2545b54fbd2e5cca9c256d4654f4b79413f5","type":"TRIGGER","name":"BIU_EBA_SALES_LEAD_ST_CDS","schemaName":"XXVENTURI","sxml":""}