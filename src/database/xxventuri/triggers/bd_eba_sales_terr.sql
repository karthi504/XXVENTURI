create or replace editionable trigger xxventuri.bd_eba_sales_terr before
    delete on xxventuri.eba_sales_territories
    for each row
begin
    eba_sales_fw.tag_sync(
        p_new_tags     => null,
        p_old_tags     => :old.tags,
        p_content_type => 'TERRITORY',
        p_content_id   => :old.id
    );
end;
/

alter trigger xxventuri.bd_eba_sales_terr enable;


-- sqlcl_snapshot {"hash":"bd5c02e836fcbaf792e8431ce8af0e09dde297ed","type":"TRIGGER","name":"BD_EBA_SALES_TERR","schemaName":"XXVENTURI","sxml":""}