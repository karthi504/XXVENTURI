create or replace editionable trigger xxventuri.bd_eba_sales_competitors before
    delete on xxventuri.eba_sales_competitors
    for each row
begin
    eba_sales_fw.tag_sync(
        p_new_tags     => null,
        p_old_tags     => :old.tags,
        p_content_type => 'COMPETITOR',
        p_content_id   => :old.id
    );
end;
/

alter trigger xxventuri.bd_eba_sales_competitors enable;


-- sqlcl_snapshot {"hash":"93af191f3d3482b0eeb44890cf825e64af95f756","type":"TRIGGER","name":"BD_EBA_SALES_COMPETITORS","schemaName":"XXVENTURI","sxml":""}