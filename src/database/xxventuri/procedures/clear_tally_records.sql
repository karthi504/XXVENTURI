create or replace procedure xxventuri.clear_tally_records is

    cursor c_invoice is
    select
        rowid
    from
        (
            select
                rowid,
                dense_rank()
                over(
                    order by
                        batch_sequence desc
                ) invoice_rank
            from
                xxeba_tally_invoices_t
        )
    where
        invoice_rank > 3;

    type delrow_type is
        table of rowid index by binary_integer;
    v_records    delrow_type;
    v_start_time number;
    v_limit      number := 5000;
    cursor c_stock is
    select
        rowid
    from
        (
            select
                rowid,
                dense_rank()
                over(
                    order by
                        batch_sequence desc
                ) stock_rank
            from
                xxeba_tally_stock_t
        )
    where
        stock_rank > 3;

    s_records    delrow_type;
    s_start_time number;
    s_limit      number := 5000;
    cursor c_receivables is
    select
        rowid
    from
        (
            select
                rowid,
                dense_rank()
                over(
                    order by
                        batch_number desc
                ) received_rank
            from
                xxeba_tally_receivables_t
        )
    where
        received_rank > 3;

    r_records    delrow_type;
    r_start_time number;
    r_limit      number := 5000;
begin
    begin
        open c_invoice;
        loop
            fetch c_invoice
            bulk collect into v_records limit v_limit;
            v_start_time := dbms_utility.get_time;
            forall vloop in v_records.first..v_records.last save exceptions
                delete from xxeba_tally_invoices_t
                where
                    rowid = v_records(vloop);

            commit;
            exit when c_invoice%notfound;
        end loop;

        close c_invoice;
    exception
        when others then
            null;
    end;
  --DBMS_OUTPUT.put_line('Bulk Delete using ROWID : ' || (DBMS_UTILITY.get_time - v_start_time));
    begin
        open c_stock;
        loop
            fetch c_stock
            bulk collect into s_records limit s_limit;
            s_start_time := dbms_utility.get_time;
            forall vloop in s_records.first..s_records.last save exceptions
                delete from xxeba_tally_stock_t
                where
                    rowid = s_records(vloop);

            commit;
            exit when c_stock%notfound;
        end loop;

        close c_stock;
    exception
        when others then
            null;
    end;

	--DBMS_OUTPUT.put_line('Bulk Delete using ROWID : ' || (DBMS_UTILITY.get_time - s_start_time));
    begin
        open c_receivables;
        loop
            fetch c_receivables
            bulk collect into r_records limit r_limit;
            r_start_time := dbms_utility.get_time;
            forall vloop in r_records.first..r_records.last save exceptions
                delete from xxeba_tally_receivables_t
                where
                    rowid = r_records(vloop);

            commit;
            exit when c_receivables%notfound;
        end loop;

        close c_receivables;
  --DBMS_OUTPUT.put_line('Bulk Delete using ROWID : ' || (DBMS_UTILITY.get_time - r_start_time));
    exception
        when others then
            null;
    end;

exception
    when others then
        null;
end clear_tally_records;
/


-- sqlcl_snapshot {"hash":"5a45bafb5a8e58be78cc40be9ab4eabdbd95aa5e","type":"PROCEDURE","name":"CLEAR_TALLY_RECORDS","schemaName":"XXVENTURI","sxml":""}