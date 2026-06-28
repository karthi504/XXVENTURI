create or replace package xxventuri.xxfs_pm_msk_js_pkg as 
----------------------------------------------------------------------------
--    Name              Date            Object Name                   Incident No                   Purpose
-- Karkuvelraja T    08-Nov-2017      XXFS_LOB_DOWNLOAD_PROC               --           To generate IReport PDF and save into oracle directory.
-- Karkuvelraja T    08-Nov-2017      XXFS_LOB_MAIL_PROC                   --           To generate send as mail with attachment.
-- Karkuvelraja T    08-Nov-2017      XXFS_GENERATE_PDF_INVOICE_PROC       --           To generate IReport PDF and save into oracle directory. then, send as pdf attachment.
----------------------------------------------------------------------------
    procedure xxfs_lob_download_proc (
        p_url             in varchar2 default null,
        p_report_name     in varchar2 default null,
        p_report_format   in varchar2 default null,
        p_datasoure       in varchar2 default null,
        p_outfilename     in varchar2 default null,
        p_report_language in varchar2 default null,
        p_encode          in varchar2 default null,
        p_filename        in varchar2 default null,
        p_p1              in number,
        p_p2              in varchar2,
        p_p3              in varchar2,
        p_p4              in varchar2,
        p_p5              in varchar2,
        p_p6              in varchar2,
        p_p7              in varchar2,
        p_p8              in varchar2,
        p_p9              in varchar2,
        p_qut_id          out number
    );

end xxfs_pm_msk_js_pkg;
/


-- sqlcl_snapshot {"hash":"654209a28b55997e1c8008f7c23cd3fa4060065b","type":"PACKAGE_SPEC","name":"XXFS_PM_MSK_JS_PKG","schemaName":"XXVENTURI","sxml":""}