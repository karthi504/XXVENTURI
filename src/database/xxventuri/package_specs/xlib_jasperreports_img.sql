create or replace package xxventuri.xlib_jasperreports_img as 
/*

 2.8.0   08.02.2022  D. Aust          #79: XLIB_HTTP http_version
                                        - added optional parameter for http version
 2.10.1  16.01.2023  D. Aust          #123: Backport constant for Oracle 11
*/
----------------------------------------------------------------------------
-- get_image: retrieves a report image from the server
----------------------------------------------------------------------------
    procedure get_image (
        p_url          in varchar2,
        p_image        in varchar2,
        p_http_version in xlib_http.http_version_1_1%type default xlib_http.http_version_1_1
    );

    procedure test;

end xlib_jasperreports_img;
/


-- sqlcl_snapshot {"hash":"c5faf24704f7ae4038f22d999ecf098ab1643d1c","type":"PACKAGE_SPEC","name":"XLIB_JASPERREPORTS_IMG","schemaName":"XXVENTURI","sxml":""}