create or replace package body xxventuri.xlib_log is

    procedure m (
        p_module in varchar2,
        p_msg    in varchar2,
        p_type   in varchar2 default 'DEBUG',
        p_level  in pls_integer default 15
    ) is
        pragma autonomous_transaction;
    begin
        insert into xlib_logs (
            log_module,
            log_msg,
            log_type,
            log_level,
            log_created_on,
            log_created_by
        ) values ( substr(p_module, 1, 100),
                   substr(p_msg, 1, 4000),
                   substr(p_type, 1, 20),
                   p_level,
                   sysdate,
                   substr(
                       nvl(
                           v('APP_USER'),
                           user
                       ),
                       1,
                       100
                   ) );

        commit;
    end;

end;
/


-- sqlcl_snapshot {"hash":"67c45e182dd29aeba688260baff09950f13b989d","type":"PACKAGE_BODY","name":"XLIB_LOG","schemaName":"XXVENTURI","sxml":""}