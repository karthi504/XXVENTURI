create or replace editionable trigger xxventuri.bd_eba_sales_cust before
    delete on xxventuri.eba_sales_customers
    for each row
begin
    eba_sales_fw.tag_sync(
        p_new_tags     => null,
        p_old_tags     => :old.tags,
        p_content_type => 'ACCOUNT',
        p_content_id   => :old.id
    );
end;
/

alter trigger xxventuri.bd_eba_sales_cust enable;


-- sqlcl_snapshot {"hash":"bfebce8073d9731a5ee7bbc377be709b75451475","type":"TRIGGER","name":"BD_EBA_SALES_CUST","schemaName":"XXVENTURI","sxml":""}