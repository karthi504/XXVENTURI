create or replace package xxventuri.xxeba_product_quotation_pkg as
    procedure xxoeb_build_report_data (
        p_opportunity_id in number,
        p_report_data    out clob
    );

    procedure xxoeb_build_report_layout (
        p_report_layout out clob
    );

    function xxeba_product_amount (
        p_order_id in varchar2
    ) return varchar2;

end xxeba_product_quotation_pkg;
/


-- sqlcl_snapshot {"hash":"6939618754af63f0e0248196201754f45f38731d","type":"PACKAGE_SPEC","name":"XXEBA_PRODUCT_QUOTATION_PKG","schemaName":"XXVENTURI","sxml":""}