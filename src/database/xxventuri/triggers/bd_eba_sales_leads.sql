create or replace editionable trigger xxventuri.bd_eba_sales_leads before
    delete on xxventuri.eba_sales_leads
    for each row
begin
    eba_sales_fw.tag_sync(
        p_new_tags     => null,
        p_old_tags     => :old.tags,
        p_content_type => 'LEAD',
        p_content_id   => :old.id
    );
end;
/

alter trigger xxventuri.bd_eba_sales_leads enable;


-- sqlcl_snapshot {"hash":"97d953f8f68502637c5412c4fb44d733debd63b9","type":"TRIGGER","name":"BD_EBA_SALES_LEADS","schemaName":"XXVENTURI","sxml":""}