create or replace editionable trigger xxventuri.biu_eba_sales_sales_periods before
    insert or update on xxventuri.eba_sales_sales_periods
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

alter trigger xxventuri.biu_eba_sales_sales_periods enable;


-- sqlcl_snapshot {"hash":"b8dba1853681927173151d263e82e7e00612014c","type":"TRIGGER","name":"BIU_EBA_SALES_SALES_PERIODS","schemaName":"XXVENTURI","sxml":""}