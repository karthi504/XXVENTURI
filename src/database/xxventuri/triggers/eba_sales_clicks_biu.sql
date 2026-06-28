create or replace editionable trigger xxventuri.eba_sales_clicks_biu before
    insert on xxventuri.eba_sales_clicks
    for each row
begin
    if :new.id is null then
        :new.id := eba_sales_acl_api.gen_id();
    end if;

    :new.view_timestamp := localtimestamp;
    :new.app_session := v('APP_SESSION');
    :new.app_username := lower(:new.app_username);
end;
/

alter trigger xxventuri.eba_sales_clicks_biu enable;


-- sqlcl_snapshot {"hash":"97534f94d68cb7fd4d55bd0b9b8e5a5e75749cb5","type":"TRIGGER","name":"EBA_SALES_CLICKS_BIU","schemaName":"XXVENTURI","sxml":""}