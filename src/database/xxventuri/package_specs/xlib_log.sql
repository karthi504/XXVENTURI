create or replace package xxventuri.xlib_log is
/*=========================================================================

  Purpose  : Application Logging
  
  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             https://github.com/daust/JasperReportsIntegration
  
  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  06.01.2010  D. Aust         Initial creation
  13.05.2012  D. Aust         insert fails when created_by user value too large

=========================================================================*/

    procedure m (
        p_module in varchar2,
        p_msg    in varchar2,
        p_type   in varchar2 default 'DEBUG',
        p_level  pls_integer default 15
    );

end;
/


-- sqlcl_snapshot {"hash":"e858ffed5796c15f788a7b7cb078d096a8a82e76","type":"PACKAGE_SPEC","name":"XLIB_LOG","schemaName":"XXVENTURI","sxml":""}