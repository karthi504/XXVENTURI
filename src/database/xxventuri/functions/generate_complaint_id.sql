create or replace function xxventuri.generate_complaint_id (
    p_number out xxeba_customer_complaints_t.complaint_number%type
) return xxeba_customer_complaints_t.complaint_number%type is

    v_complaint_code    varchar2(100);
    v_startwith         number := 1;
    v_running_no_length number := 6;
    v_prefix            varchar2(10);
    v_complaint_number  number;
    v_month_flag        varchar2(10);
    v_year_flag         varchar2(10);
    cursor cinc is
    select
        nvl(
            max(complaint_number),
            0
        ) m_in_no
    from
        xxeba_customer_complaints_t
    where
        to_char(created, 'YYYY') = to_char(sysdate, 'YYYY');

    rinc                cinc%rowtype;
begin
    open cinc;
    fetch cinc into rinc;
    close cinc;
    v_complaint_number := rinc.m_in_no + 1;
    v_month_flag := to_char(sysdate, 'MM');
    v_year_flag := to_char(sysdate, 'YY');
    v_prefix := v_year_flag || v_month_flag;
    v_complaint_code := v_prefix
                        || lpad(v_complaint_number,
                                nvl(v_running_no_length,
                                    length(v_startwith) + 1),
                                '0');

    p_number := v_complaint_number;
    return v_complaint_code;
exception
    when others then
        raise_application_error(-20001, sqlerrm);
end generate_complaint_id;
/


-- sqlcl_snapshot {"hash":"d6139ed34b90a23429fbca45460ec78fbb1e1118","type":"FUNCTION","name":"GENERATE_COMPLAINT_ID","schemaName":"XXVENTURI","sxml":""}