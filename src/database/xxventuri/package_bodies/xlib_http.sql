create or replace package body xxventuri.xlib_http as
/*=========================================================================

  Purpose  : Make http callouts

  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             https://github.com/daust/JasperReportsIntegration

 Version Date        Author           Comment
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         19.02.2007  D. Aust          initial creation
         07.08.2008  D. Aust          - added check_get_request
                                      - display_url_raw: pass all request headers
                                          to the client
         05.08.2012  D. Aust		      suppress mime header TRANSFER-ENCODING,
                                        causes lots of problems with XMLDB listener
                                        and others choking.
 2.3.0.0 19.05.2014  D. Aust          - #294 - Fix chunked encoding problem in 
                                          xlib_http.get_report
                                      - added version information to this package
 2.3.0.0 09.05.2015  D. Aust          pass JSESSIONID from backend J2EE server to client 
                                        for image rendering in html reports                                         
 2.6.1   28.09.2020  D. Aust          #40 - APEX 20.1 security bundle (PSE 30990551) 
                                        rejects response header "Cache-Control: private"
 2.6.2   13.10.2020  D. Aust          - added function check_acl()
 2.8.0   08.02.2022  D. Aust          #79: XLIB_HTTP http_version
                                        - added optional parameter for http version
 2.10.1  16.01.2023  D. Aust          #123: Backport constant for Oracle 11

=========================================================================*/

    m_module varchar2(50) := 'XLIB_HTTP';

    procedure display_url_raw (
        p_url                varchar2,
        p_mime_type_override in varchar2 default null,
        p_charset            in varchar2 default null,
        p_header_name_arr    in vc_arr_t default g_empty_vc_arr,
        p_header_value_arr   in vc_arr_t default g_empty_vc_arr,
        p_http_version       in xlib_http.http_version_1_1%type default xlib_http.http_version_1_1
    ) is

        l_http_request     utl_http.req;
        l_http_response    utl_http.resp;
        l_blob             blob;
        l_raw              raw(32767);
        l_buffer_size      number := 32767;
      --
        l_proc             varchar2(100) := m_module || '.DISPLAY_URL_RAW';
      --
        l_mime_type        varchar2(100);
        l_header_name      varchar2(256);
        l_header_value     varchar2(1024);
        l_jsession         varchar2(256);
        l_path             varchar2(1024);
      --
        l_header_name_arr  vc_arr_t;
        l_header_value_arr vc_arr_t;
      --
        l_msg              varchar2(32767);
    begin
        xlog(l_proc, 'show url: ' || p_url);
      --htp.flush();
      --htp.init();

      -- Initialize the BLOB.
        dbms_lob.createtemporary(l_blob, false);
        l_http_request := utl_http.begin_request(
            url          => p_url,
            method       => 'GET',
            http_version => p_http_version
        );

        utl_http.set_header(l_http_request, 'Connection', 'Keep-Alive');

      -- pass additional headers to the target service
        for i in 1..p_header_name_arr.count loop
            xlog(l_proc,
                 'pass additional headers to target service: '
                 || p_header_name_arr(i)
                 || ': '
                 || p_header_value_arr(i));

            utl_http.set_header(l_http_request,
                                p_header_name_arr(i),
                                p_header_value_arr(i));
        end loop;

      -- get response from target service
        l_http_response := utl_http.get_response(l_http_request);
        for i in 1..utl_http.get_header_count(l_http_response) loop
            utl_http.get_header(l_http_response, i, l_header_name, l_header_value);
         -- store header value in arr
            l_header_name_arr(i) := l_header_name;
            l_header_value_arr(i) := l_header_value;
            if lower(l_header_name) = 'content-type' then
                l_mime_type := l_header_value;
                xlog(l_proc, 'content-type from server: ' || l_mime_type);
            end if;

        end loop;

      -- override mime type
        if p_mime_type_override is not null then
            l_mime_type := p_mime_type_override;
        end if;

      -- Copy the response into the BLOB.
        begin
            loop
                utl_http.read_raw(l_http_response, l_raw, l_buffer_size);
                dbms_lob.writeappend(l_blob,
                                     utl_raw.length(l_raw),
                                     l_raw);
            end loop;
        exception
            when utl_http.end_of_body then
                utl_http.end_response(l_http_response);
        end;

        xlog(l_proc, 'set content-type: ' || l_mime_type);
        owa_util.mime_header(
            ccontent_type => l_mime_type,
            bclose_header => false,
            ccharset      => p_charset
        );

        for i in 1..l_header_name_arr.count loop
            if upper(l_header_name_arr(i)) in ( 'CONTENT-LENGTH', 'CONTENT-TYPE', 'MIME-TYPE', 'TRANSFER-ENCODING', 'STRICT-TRANSPORT-SECURITY'
            ,
                                                'CACHE-CONTROL', 'PRAGMA', 'EXPIRES' ) then
            --xlog (l_proc, 'skip header ' || l_header_name_arr (i));
                null;
            else
                if
                    upper(l_header_name_arr(i)) = 'SET-COOKIE'
                    and l_header_value_arr(i) like 'JSESSIONID%'
                then
                    xlog(l_proc,
                         'JSESSION_ID found !!!:' || l_header_value_arr(i));
              --extract path
                    l_jsession := regexp_substr(
                        l_header_value_arr(i),
                        'JSESSIONID=(.*);[ ]*Path',
                        1,
                        1,
                        'i',
                        1
                    );

                    l_path := regexp_substr(
                        l_header_value_arr(i),
                        ';[ ]*Path=(.*)',
                        1,
                        1,
                        'i',
                        1
                    );

                    xlog(l_proc,
                         'xx:full:'
                         || l_header_value_arr(i)
                         || '; xx:session:'
                         || l_jsession
                         || '; xx:path:'
                         || l_path);

                else
                    l_header_value := l_header_value_arr(i);
                end if;

                xlog(l_proc,
                     'set header:'
                     || l_header_name_arr(i)
                     || ': '
                     || l_header_value);

                htp.p(l_header_name_arr(i)
                      || ': ' || l_header_value);
            end if;
        end loop;

      -- JSESSION Cookies ausgeben
      -- if using tunnel, then the cookie is JRI_JSESSIONID
      -- if not using tunnel, then cookie is JSESSIONID directly
      --
        if xlib_jasperreports.get_use_images_no_tunnel = false then
            l_msg := 'Set-Cookie: '
                     || xlib_jasperreports.m_jri_cookie_name_c
                     || '='
                     || l_jsession;
            xlog(l_proc, 'set header:' || l_msg);
            htp.p(l_msg);
            l_msg := 'Set-Cookie: '
                     || xlib_jasperreports.m_jri_path_cookie_name_c
                     || '='
                     || l_path;
            xlog(l_proc, 'set header:' || l_msg);
            htp.p(l_msg);
        else
            l_msg := 'Set-Cookie: JSESSIONID=' || l_jsession;
            if xlib_jasperreports.get_cookie_path_no_tunnel is not null then
                l_msg := l_msg
                         || '; Path='
                         || xlib_jasperreports.get_cookie_path_no_tunnel;
            end if;

            xlog(l_proc, 'set header:' || l_msg);
            htp.p(l_msg);
        end if;

      -- set content length
        htp.p('Content-length: ' || dbms_lob.getlength(l_blob));
        owa_util.http_header_close;
        wpg_docload.download_file(l_blob);
      -- Relase the resources associated with the temporary LOB.
        dbms_lob.freetemporary(l_blob);
    exception
        when utl_http.end_of_body then
            utl_http.end_response(l_http_response);
            dbms_lob.freetemporary(l_blob);
            raise;
        when others then
            xlog(l_proc, 'Error: ' || sqlerrm, 'ERROR');
            raise;
    end;

    procedure retrieve_blob_from_url (
        p_url          in varchar2,
        o_blob         out blob,
        o_mime_type    out varchar2,
        p_http_version in xlib_http.http_version_1_1%type default xlib_http.http_version_1_1
    ) is

        l_http_request  utl_http.req;
        l_http_response utl_http.resp;
        l_raw           raw(32767);
      --
        l_proc          varchar2(100) := m_module || '.RETRIEVE_BLOB_FROM_URL';
      --
        l_header_name   varchar2(256);
        l_header_value  varchar2(1024);
    begin
      -- Initialize the BLOB.
        dbms_lob.createtemporary(o_blob, false);
        l_http_request := utl_http.begin_request(
            url          => p_url,
            method       => 'GET',
            http_version => p_http_version
        );

        l_http_response := utl_http.get_response(l_http_request);
        for i in 1..utl_http.get_header_count(l_http_response) loop
            utl_http.get_header(l_http_response, i, l_header_name, l_header_value);
            if lower(l_header_name) = 'content-type' then
                o_mime_type := l_header_value;
            end if;
        end loop;

      -- Copy the response into the BLOB.
        begin
            loop
                utl_http.read_raw(l_http_response, l_raw, 32767);
                dbms_lob.writeappend(o_blob,
                                     utl_raw.length(l_raw),
                                     l_raw);
            end loop;
        exception
            when utl_http.end_of_body then
                utl_http.end_response(l_http_response);
        end;
   -- Relase the resources associated with the temporary LOB.
   --DBMS_LOB.freetemporary (l_blob);
    exception
        when others then
            utl_http.end_response(l_http_response);
            dbms_lob.freetemporary(o_blob);
            xlog(l_proc, 'Error: ' || sqlerrm, 'ERROR');
            raise;
    end;

    function escape_form_data (
        s varchar2
    ) return varchar2 is

        l_s varchar2(500 char);

        function r (
            s varchar2,
            c varchar2
        ) return varchar2 is
        begin
            return replace(s,
                           c,
                           '%'
                           || trim(to_char(
                                   ascii(c),
                                   'XX'
                               )));
        end;

    begin
        l_s := s;
        l_s := replace(l_s, ' ', '+');
        l_s := r(l_s,
                 chr(37));  -- %
        l_s := r(l_s,
                 chr(37));  -- /
        l_s := r(l_s,
                 chr(63));  -- ?
        l_s := r(l_s,
                 chr(38));  -- &
        l_s := r(l_s,
                 chr(228));  -- ‰
        l_s := r(l_s,
                 chr(196));  -- ƒ
        l_s := r(l_s,
                 chr(246));  -- ˆ
        l_s := r(l_s,
                 chr(214));  -- ÷
        l_s := r(l_s,
                 chr(252));  -- ¸
        l_s := r(l_s,
                 chr(220));  -- ‹
        l_s := r(l_s,
                 chr(223));  -- ﬂ
        return l_s;
    end;

    function check_get_request (
        p_url varchar2
    ) return char is
        l_clob clob;
    begin
        if p_url is null then
            return c_fail;
        end if;
        select
            httpuritype(p_url).getclob()
        into l_clob
        from
            dual;

      /*SELECT c_success
        INTO l_ret
        FROM DUAL
       WHERE EXISTS (SELECT HTTPURITYPE (p_url).getclob ()
                       FROM DUAL);
                       */
        return c_success;
    exception
        when others then
            return c_fail;
    end;

    function check_acl (
        p_url varchar2
    ) return char is
        l_clob clob;
    begin
        if p_url is null then
            return c_fail;
        end if;
        select
            httpuritype(p_url).getclob()
        into l_clob
        from
            dual;

      /*SELECT c_success
        INTO l_ret
        FROM DUAL
       WHERE EXISTS (SELECT HTTPURITYPE (p_url).getclob ()
                       FROM DUAL);
                       */
        return c_success;
    exception
        when others then
         -- acl problem
            if sqlcode = 24247 then
                return c_fail;
            else
            -- no acl problem
                return c_success;
            end if;
    end;

end;
/


-- sqlcl_snapshot {"hash":"43db51082ab4682dc4d8318767481fd83db8d39d","type":"PACKAGE_BODY","name":"XLIB_HTTP","schemaName":"XXVENTURI","sxml":""}