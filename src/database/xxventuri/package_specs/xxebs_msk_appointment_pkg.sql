create or replace package xxventuri.xxebs_msk_appointment_pkg as
    procedure xxeba_schedule_appointment (
        p_appointment_month varchar2
    );

end xxebs_msk_appointment_pkg;
/


-- sqlcl_snapshot {"hash":"24977e5ac0d02cf357d957c92150aea474617075","type":"PACKAGE_SPEC","name":"XXEBS_MSK_APPOINTMENT_PKG","schemaName":"XXVENTURI","sxml":""}