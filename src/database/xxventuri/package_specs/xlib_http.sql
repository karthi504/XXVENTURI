create or replace package xxventuri.xlib_http as
/*=========================================================================

  Purpose  : Make http callouts

  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             http://www.opal-consulting.de/pls/apex/f?p=20090928:14

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
 2.11.0  25.01.2023  D. Aust          - Tested and fixed on Oracle11g - %Type works on variables-not constants

=========================================================================*/

    c_success constant char(1) := '1';
    c_fail constant char(1) := '0';

  -- version of this package
    version_c constant varchar2(20 char) := '2.10.1';
    http_version_1_1 varchar2(64) := 'HTTP/1.1'; -- #123

    type vc_arr_t is
        table of varchar2(32767) index by binary_integer;
    g_empty_vc_arr vc_arr_t;

/* Function: display_url_raw
 *
 * Parameters:
 *
 *    x - Description of x.
 *    y - Description of y.
 *    z - Description of z.
 */
    procedure display_url_raw (
        p_url                varchar2,
        p_mime_type_override in varchar2 default null,
        p_charset            in varchar2 default null,
        p_header_name_arr    in vc_arr_t default g_empty_vc_arr,
        p_header_value_arr   in vc_arr_t default g_empty_vc_arr,
        p_http_version       in xlib_http.http_version_1_1%type default xlib_http.http_version_1_1
    );

/* Procedure: retrieve_blob_from_url

   Multiplies two integers.

   Parameters:

      p_url - url to be called

      o_blob - output: the resulting out blob
      o_mime_type - output: the resulting out mime type from the call 

   Returns:

      The two integers multiplied together.
      o_blob - the resulting out blob

   See Also:

      <escape_form_data>
*/
    procedure retrieve_blob_from_url (
        p_url          in varchar2,
        o_blob         out blob,
        o_mime_type    out varchar2,
        p_http_version in xlib_http.http_version_1_1%type default xlib_http.http_version_1_1
    );

/* 
Function: escape_form_data 
Here is some describing text ... 

--- SQL
declare
  l_i number;
begin
  null;

  Select count(*)
    into l_count
    from dual;
end;
---

Parameters:
  s - string to be escaped

Returns: 
the escaped data
*/
    function escape_form_data (
        s varchar2
    ) return varchar2;

/*
Function: check_get_request

Parameters:
   p_url    the url to be called

Returns:
   Returns c_fail or c_success

*/
    function check_get_request (
        p_url varchar2
    ) return char;

/*
Function: check_acl

Parameters:
   p_url    the url to be called

Returns:
   Returns c_fail or c_success
*/
    function check_acl (
        p_url varchar2
    ) return char;

end;
/


-- sqlcl_snapshot {"hash":"1b2e5df074e196179caa203b2dfe4369d5acf2be","type":"PACKAGE_SPEC","name":"XLIB_HTTP","schemaName":"XXVENTURI","sxml":""}