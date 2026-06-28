create or replace editionable trigger xxventuri.xxeba_biu_sales_order before
    insert or update on xxventuri.xxeba_sales_order
    for each row
declare begin
    if
        inserting
        and :new.order_id is null
    then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.order_id
        from
            dual;

    end if;

    if inserting then
        :new.created := localtimestamp;       
		--:new.created_by := nvl(wwv_flow.g_user,user);       
        :new.updated := localtimestamp;       
		--:new.updated_by := nvl(wwv_flow.g_user,user);
		--:new.STATUS := 'Y';	
      --  :new:export_flag := 'N';
	--	:new.row_version_number := 1;       
    elsif updating then       
	--	:new.row_version_number := nvl(:old.row_version_number,1) + 1;         
        :new.updated := localtimestamp;       
		--:new.updated_by := nvl(wwv_flow.g_user,user);   
    end if;

end;
/

alter trigger xxventuri.xxeba_biu_sales_order enable;


-- sqlcl_snapshot {"hash":"6c5165704d21d785e2f9989efca62b7c1e692e10","type":"TRIGGER","name":"XXEBA_BIU_SALES_ORDER","schemaName":"XXVENTURI","sxml":""}