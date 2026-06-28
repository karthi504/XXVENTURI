create or replace editionable trigger xxventuri.xxfs_pm_mob_manage_dev_biu before
    insert or update on xxventuri.xxfs_pm_mob_manage_dev_list
    for each row
declare begin
    if
        inserting
        and :new.id is null
    then
        select
            xxfs_pm_mob_manage_dev_seq.nextval
        into :new.id
        from
            dual;

    end if;

    if inserting then
        :new.status := 'Y';
        :new.creation_date := localtimestamp;
        :new.update_date := localtimestamp;
    end if;

    if updating then
        :new.update_date := localtimestamp;
    end if;
end;
/

alter trigger xxventuri.xxfs_pm_mob_manage_dev_biu enable;


-- sqlcl_snapshot {"hash":"20dd12f6a9c35459d162a6ebe62af5b9a4229fd0","type":"TRIGGER","name":"XXFS_PM_MOB_MANAGE_DEV_BIU","schemaName":"XXVENTURI","sxml":""}