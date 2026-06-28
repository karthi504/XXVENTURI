create or replace editionable trigger xxventuri.apex$team_dev_files_biu before
    insert or update on xxventuri.apex$team_dev_files
    for each row
declare
    l_filesize_quota number := 15728640;
    l_filesize_mb    number;
begin
    for c1 in (
        select
            team_dev_fs_limit
        from
            apex_workspaces
        where
            workspace_id = v('APP_SECURITY_GROUP_ID')
    ) loop
        l_filesize_quota := c1.team_dev_fs_limit;
        l_filesize_mb := l_filesize_quota / 1048576;
    end loop;

    if :new.id is null then
        select
            to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        into :new.id
        from
            sys.dual;

    end if;

    if inserting then
        :new.created := localtimestamp;
        :new.created_by := nvl(wwv_flow.g_user, user);
        :new.updated := localtimestamp;
        :new.updated_by := nvl(wwv_flow.g_user, user);
        :new.row_version_number := 1;
    elsif updating then
        :new.row_version_number := nvl(:old.row_version_number,
                                       1) + 1;
    end if;

    if
        ( inserting
        or updating )
        and nvl(
            sys.dbms_lob.getlength(:new.file_blob),
            0
        ) > l_filesize_quota
    then
        raise_application_error(-20000,
                                wwv_flow_lang.system_message('FILE_TOO_LARGE',
                                                             trunc(l_filesize_mb)));
    end if;

    if inserting
    or updating then
        :new.updated := localtimestamp;
        :new.updated_by := nvl(wwv_flow.g_user, user);
    end if;

end;
/

alter trigger xxventuri.apex$team_dev_files_biu enable;


-- sqlcl_snapshot {"hash":"959fbbb19740c44b66392007ed3563dcc17fac1e","type":"TRIGGER","name":"APEX$TEAM_DEV_FILES_BIU","schemaName":"XXVENTURI","sxml":""}