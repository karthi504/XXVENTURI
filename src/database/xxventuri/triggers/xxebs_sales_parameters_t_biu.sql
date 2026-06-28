create or replace editionable trigger xxventuri.xxebs_sales_parameters_t_biu before
    insert or update on xxventuri.xxeba_sales_parameters_t
    for each row
declare begin
    if
        inserting
        and :new.parameter_id is null
    then
        select
            xxebs_sales_parameters_seq.nextval
        into :new.parameter_id
        from
            dual;

    end if;

    if inserting then
        :new.status := 'Y';
        :new.created_by := nvl(
            v('APP_USER'),
            user
        );
        :new.creation_date := localtimestamp;
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.update_date := localtimestamp;
    end if;

    if updating then
        :new.updated_by := nvl(
            v('APP_USER'),
            user
        );
        :new.update_date := localtimestamp;
    end if;

end;
/

alter trigger xxventuri.xxebs_sales_parameters_t_biu enable;


-- sqlcl_snapshot {"hash":"294302fef626bfbf4e449e59ac0f23597523feef","type":"TRIGGER","name":"XXEBS_SALES_PARAMETERS_T_BIU","schemaName":"XXVENTURI","sxml":""}