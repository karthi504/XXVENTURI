create or replace package xxventuri.xxfs_pm_error_log_pkg as
    function get_log_id return number;

    procedure record_log (
        p_log_type  in varchar2,
        p_proc_name in varchar2,
        p_log_text  in varchar2,
        p_block     in number default null
    );

    procedure clear_log;

end xxfs_pm_error_log_pkg;
/


-- sqlcl_snapshot {"hash":"88694d959f18c30125dd3d9c605b65efebfa8bd2","type":"PACKAGE_SPEC","name":"XXFS_PM_ERROR_LOG_PKG","schemaName":"XXVENTURI","sxml":""}