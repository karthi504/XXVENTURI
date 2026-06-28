create or replace editionable trigger xxventuri.eba_sales_errors_bi before
    insert or update on xxventuri.eba_sales_errors
    for each row
begin
    if :new.id is null then
        :new.id := eba_sales_acl_api.gen_id();
    end if;
end;
/

alter trigger xxventuri.eba_sales_errors_bi enable;


-- sqlcl_snapshot {"hash":"d74bbaf83935d006057d38b209bf91bd27141ffe","type":"TRIGGER","name":"EBA_SALES_ERRORS_BI","schemaName":"XXVENTURI","sxml":""}