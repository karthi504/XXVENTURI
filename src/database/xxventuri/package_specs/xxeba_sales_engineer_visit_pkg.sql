create or replace package xxventuri.xxeba_sales_engineer_visit_pkg as
    procedure daily_visit (
        p_appointment_month varchar2
    );

    procedure monthly_once_visit (
        p_appointment_month varchar2
    );

    procedure monthly_twice_visit (
        p_appointment_month varchar2
    );

    procedure monthly_thrice_visit (
        p_appointment_month varchar2
    );

    procedure weekly_once_visit (
        p_appointment_month varchar2
    );

    procedure wekkly_twice_visit (
        p_appointment_month varchar2
    );

    procedure visit_time (
        p_appointment_month varchar2
    );

end xxeba_sales_engineer_visit_pkg;
/


-- sqlcl_snapshot {"hash":"09b1877dd6553b48c3c3082fcf0f627a1a456ef6","type":"PACKAGE_SPEC","name":"XXEBA_SALES_ENGINEER_VISIT_PKG","schemaName":"XXVENTURI","sxml":""}