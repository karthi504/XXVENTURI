create or replace editionable trigger xxventuri.bd_eba_sales_cust_contacts before
    delete on xxventuri.eba_sales_customer_contacts
    for each row
begin
    eba_sales_fw.tag_sync(
        p_new_tags     => null,
        p_old_tags     => :old.tags,
        p_content_type => 'CONTACT',
        p_content_id   => :old.id
    );
end;
/

alter trigger xxventuri.bd_eba_sales_cust_contacts enable;


-- sqlcl_snapshot {"hash":"6b7f5c09b312a5120bc5a9b381e6c6d781befe4f","type":"TRIGGER","name":"BD_EBA_SALES_CUST_CONTACTS","schemaName":"XXVENTURI","sxml":""}