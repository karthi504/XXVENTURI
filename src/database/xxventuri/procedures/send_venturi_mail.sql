create or replace procedure xxventuri.send_venturi_mail (
    p_to          in varchar2,
    p_cc          in varchar2,
    p_bcc         in varchar2,
    p_from        in varchar2,
    p_subject     in varchar2,
    p_text_msg    in varchar2 default null,
    p_attach_name in varchar2 default null,
    p_attach_mime in varchar2 default null,
    p_attach_clob in clob default null
) as

    l_mail_conn utl_smtp.connection;
    l_boundary  varchar2(50) := '----=*#abc1234321cba#*=';
    l_step      pls_integer := 12000; -- make sure you set a multiple of 3 not higher than 24573
    username    varchar2(20) := 'crm@venturitool.com';
    password    varchar2(20) := 'omyQq(sdS8';
begin
    l_mail_conn := utl_smtp.open_connection('smtp.venturitool.com', 25);
    begin
        utl_smtp.helo(l_mail_conn, 'venturitool.com');
        utl_smtp.command(l_mail_conn, 'AUTH LOGIN');
        utl_smtp.command(l_mail_conn,
                         utl_raw.cast_to_varchar2(utl_encode.base64_encode(utl_raw.cast_to_raw(username))));

        utl_smtp.command(l_mail_conn,
                         utl_raw.cast_to_varchar2(utl_encode.base64_encode(utl_raw.cast_to_raw(password))));

        utl_smtp.mail(l_mail_conn, p_from);
        utl_smtp.rcpt(l_mail_conn, p_to);
        utl_smtp.rcpt(l_mail_conn, p_cc);
        utl_smtp.rcpt(l_mail_conn, p_bcc);
        utl_smtp.open_data(l_mail_conn);
        utl_smtp.write_data(l_mail_conn,
                            'Date: '
                            || to_char(sysdate, 'DD-MON-YYYY HH24:MI')
                            || utl_tcp.crlf);

        utl_smtp.write_data(l_mail_conn, 'To: '
                                         || p_to
                                         || utl_tcp.crlf);
        utl_smtp.write_data(l_mail_conn, 'From: '
                                         || p_from
                                         || utl_tcp.crlf);
        utl_smtp.write_data(l_mail_conn, 'Subject: '
                                         || p_subject
                                         || utl_tcp.crlf);
        utl_smtp.write_data(l_mail_conn, 'Reply-To: '
                                         || p_from
                                         || utl_tcp.crlf);
        utl_smtp.write_data(l_mail_conn, 'MIME-Version: 1.0' || utl_tcp.crlf);
        utl_smtp.write_data(l_mail_conn, 'Content-Type: multipart/mixed; boundary="'
                                         || l_boundary
                                         || '"'
                                         || utl_tcp.crlf
                                         || utl_tcp.crlf);

        if p_text_msg is not null then
            utl_smtp.write_data(l_mail_conn, '--'
                                             || l_boundary
                                             || utl_tcp.crlf);
            utl_smtp.write_data(l_mail_conn, 'Content-Type: text/plain; charset="iso-8859-1"'
                                             || utl_tcp.crlf
                                             || utl_tcp.crlf);

            utl_smtp.write_data(l_mail_conn, p_text_msg);
            utl_smtp.write_data(l_mail_conn, utl_tcp.crlf || utl_tcp.crlf);
        end if;

        if p_attach_name is not null then
            utl_smtp.write_data(l_mail_conn, '--'
                                             || l_boundary
                                             || utl_tcp.crlf);
            utl_smtp.write_data(l_mail_conn, 'Content-Type: '
                                             || p_attach_mime
                                             || '; name="'
                                             || p_attach_name
                                             || '"'
                                             || utl_tcp.crlf);

            utl_smtp.write_data(l_mail_conn, 'Content-Disposition: attachment; filename="'
                                             || p_attach_name
                                             || '"'
                                             || utl_tcp.crlf
                                             || utl_tcp.crlf);

            for i in 0..trunc((dbms_lob.getlength(p_attach_clob) - 1) / l_step) loop
                utl_smtp.write_data(l_mail_conn,
                                    dbms_lob.substr(p_attach_clob, l_step, i * l_step + 1));
            end loop;

            utl_smtp.write_data(l_mail_conn, utl_tcp.crlf || utl_tcp.crlf);
        end if;

        utl_smtp.write_data(l_mail_conn, '--'
                                         || l_boundary
                                         || '--'
                                         || utl_tcp.crlf);

    exception
        when others then
            utl_smtp.close_data(l_mail_conn);
            utl_smtp.quit(l_mail_conn);
    end;

    utl_smtp.close_data(l_mail_conn);
    utl_smtp.quit(l_mail_conn);
end;
/


-- sqlcl_snapshot {"hash":"d3f5854a9316603d8989de24a40ec48890015b2c","type":"PROCEDURE","name":"SEND_VENTURI_MAIL","schemaName":"XXVENTURI","sxml":""}