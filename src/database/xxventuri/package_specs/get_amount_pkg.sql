create or replace package xxventuri.get_amount_pkg as
    function get_overdue_amount (
        p_customer_id varchar2
    ) return number;

    function get_total_outstanding (
        p_customer_id varchar2
    ) return number;

end get_amount_pkg;
/


-- sqlcl_snapshot {"hash":"a3102c63cc11e7bf30ca5edb4478e0b3f5701a1d","type":"PACKAGE_SPEC","name":"GET_AMOUNT_PKG","schemaName":"XXVENTURI","sxml":""}