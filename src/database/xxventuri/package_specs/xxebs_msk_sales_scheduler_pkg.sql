create or replace package xxventuri.xxebs_msk_sales_scheduler_pkg as
    procedure xxebs_new_account_mail;

    procedure xxeba_daily_trans_summary (
        app_id   in number,
        app_name in varchar2
    );

end xxebs_msk_sales_scheduler_pkg;
/


-- sqlcl_snapshot {"hash":"03401b22c4a0d32f90b7cd7191bce1f91a43e07d","type":"PACKAGE_SPEC","name":"XXEBS_MSK_SALES_SCHEDULER_PKG","schemaName":"XXVENTURI","sxml":""}