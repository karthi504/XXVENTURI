create or replace procedure xxventuri.xlog (
    p_module in varchar2,
    p_msg    in varchar2,
    p_type   in varchar2 default 'DEBUG',
    p_level  pls_integer default 15
) is
begin
    xlib_log.m(
        p_module => p_module,
        p_msg    => p_msg,
        p_type   => p_type,
        p_level  => p_level
    );
end xlog;
/


-- sqlcl_snapshot {"hash":"788a93a7fc27e466f3cb64a8dd595b1be44fc802","type":"PROCEDURE","name":"XLOG","schemaName":"XXVENTURI","sxml":""}