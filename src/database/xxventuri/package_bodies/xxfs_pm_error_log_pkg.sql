create or replace package body xxventuri.xxfs_pm_error_log_pkg as

    function get_log_id return number as
        lv_id number;
    begin
        begin
            select
                xxfs_pm_log_error_seq.nextval
            into lv_id
            from
                dual;

        exception
            when others then
                lv_id := -1;
        end;

        return lv_id;
    end get_log_id;

    procedure record_log (
        p_log_type  in varchar2,
        p_proc_name in varchar2,
        p_log_text  in varchar2,
        p_block     in number default null
    ) as

        lv_seq_id     number;
        lv_session    number;
        lv_user       varchar2(50);
        lv_log_msg    varchar2(4000);
        lv_proc_name  varchar2(100) := 'XXFS_PM_LOG_PKG.RECORD_LOG';
        lv_error_code number;
        lv_error_msg  varchar2(32767);
        lv_backtrace  clob;
        pragma autonomous_transaction;
    begin
        begin
            select
                get_log_id,
                v('APP_SESSION'),
                v('APP_USER')
            into
                lv_seq_id,
                lv_session,
                lv_user
            from
                dual;

        exception
            when others then
                lv_seq_id := -1;
                lv_session := -1;
        end;

        begin
            lv_log_msg := substr(p_log_text, 1, 3990);
            if upper(p_log_type) like '%ERROR%'
               or upper(p_log_type) like '%EXCEPTION%' then
                lv_error_code := sqlcode;
                lv_error_msg := sqlerrm;
                lv_backtrace := dbms_utility.format_call_stack
                                || '<br><br>'
                                || dbms_utility.format_error_backtrace;
            end if;

            insert into xxfs_pm_error_log_t (
                log_id,
                session_id,
                log_type,
                process_name,
                log_text,
                log_user,
                block_number,
                error_code,
                error_message,
                backtrace,
                created_by,
                creation_date
            ) values ( lv_seq_id,
                       lv_session,
                       p_log_type,
                       p_proc_name,
                       lv_log_msg,
                       lv_user,
                       p_block,
                       lv_error_code,
                       lv_error_msg,
                       lv_backtrace,
                       v('APP_USER'),
                       localtimestamp );

            commit;
        exception
            when others then
                lv_error_code := sqlcode;
                lv_error_msg := 'Error in Logging' || sqlerrm;
                lv_backtrace := dbms_utility.format_call_stack
                                || '<br><br>'
                                || dbms_utility.format_error_backtrace;
                insert into xxfs_pm_error_log_t (
                    log_id,
                    session_id,
                    log_type,
                    process_name,
                    log_text,
                    log_user,
                    block_number,
                    error_code,
                    error_message,
                    backtrace,
                    created_by,
                    creation_date
                ) values ( lv_seq_id,
                           lv_session,
                           'LOG_ERROR',
                           lv_proc_name,
                           null,
                           lv_user,
                           1,
                           lv_error_code,
                           lv_error_msg,
                           dbms_utility.format_call_stack
                           || '<br><br>'
                           || dbms_utility.format_error_backtrace,
                           v('APP_USER'),
                           localtimestamp );

        end;

    end record_log;

    procedure clear_log is
    begin
        begin
            delete from xxfs_pm_error_log_t
            where
                trunc(creation_date) < trunc(sysdate) - 30;

            commit;
        exception
            when others then
                null;
        end;
    end;

end xxfs_pm_error_log_pkg;
/


-- sqlcl_snapshot {"hash":"f01fdb823612fb3c8558be9dcaca990ee2dd4be1","type":"PACKAGE_BODY","name":"XXFS_PM_ERROR_LOG_PKG","schemaName":"XXVENTURI","sxml":""}