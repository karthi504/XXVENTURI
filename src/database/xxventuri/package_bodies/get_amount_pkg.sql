create or replace package body xxventuri.get_amount_pkg as

    function get_overdue_amount (
        p_customer_id varchar2
    ) return number is
        lv_pending_amount varchar2(100);
        lv_batch          number;
    begin
        select
            max(batch_number)
        into lv_batch
        from
            xxeba_tally_receivables_t;

        select
            sum(nvl(to_number(r.inv_pending_amount), 0))
        into lv_pending_amount
        from
            xxeba_tally_receivables_t r
        where
                r.batch_number = lv_batch
            and customer_id = p_customer_id
            and (
                case
                    when r.invoice_date + (
                        select
                            nvl(sc.credit_terms_rec, 0)
                        from
                            xxeba_sales_customer_details sc
                        where
                            sc.customer_id = (
                                select
                                    cus.id
                                from
                                    eba_sales_customers cus
                                where
                                    cus.row_key = r.customer_id
                            )
                    ) - sysdate > 0 then
                        1
                    else
                        0
                end
            ) = 0;

        return lv_pending_amount;
    end get_overdue_amount;

    function get_total_outstanding (
        p_customer_id varchar2
    ) return number is
        lv_total_amount varchar2(100) := 0;
        lv_batch        number;
    begin
        select
            max(batch_number)
        into lv_batch
        from
            xxeba_tally_receivables_t;

        begin
            select
                sum(nvl(to_number(inv_pending_amount), 0))
            into lv_total_amount
            from
                xxeba_tally_receivables_t r
            where
                    r.batch_number = lv_batch
                and customer_id = p_customer_id;

        end;

        return lv_total_amount;
    end get_total_outstanding;

end get_amount_pkg;
/


-- sqlcl_snapshot {"hash":"49f777a319dfff6f5a47bf36b7ebe3840f221ff4","type":"PACKAGE_BODY","name":"GET_AMOUNT_PKG","schemaName":"XXVENTURI","sxml":""}