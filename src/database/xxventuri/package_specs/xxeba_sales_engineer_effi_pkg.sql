create or replace package xxventuri.xxeba_sales_engineer_effi_pkg as
    function xxeba_sales_find_new_customer (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number;

    function xxeba_sales_customer_visit (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number;

    function xxeba_sales_conducting_trials (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number;

    function xxeba_sales_quote_submission (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number;

    function xxeba_sales_negotiation (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number;

    function xxeba_sales_po_collection (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number;

    function xxeba_sales_so (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number;

    function xxeba_sales_material_planning (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number;

    function xxeba_sales_material_supply (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number;

    function xxeba_sales_margin (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number;

    function xxeba_sales_discipline (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number;

    function xxeba_sales_report_submit (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number;

    function xxeba_sales_rewards (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number;

    function xxeba_sales_payment_collection (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number;

end xxeba_sales_engineer_effi_pkg;
/


-- sqlcl_snapshot {"hash":"3a6dc8d8089e3298b6320c64c532dc463ddd0f2a","type":"PACKAGE_SPEC","name":"XXEBA_SALES_ENGINEER_EFFI_PKG","schemaName":"XXVENTURI","sxml":""}