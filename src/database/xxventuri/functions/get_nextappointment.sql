create or replace function xxventuri.get_nextappointment (
    f_appointment_id in number
) return date is

    v_loop_value        apex_application_global.vc_arr2;
    v_date              date;
    v_savedate          date := null;
    v_shedule_type      varchar2(1);
    v_schedule_sequence varchar2(500);
begin
	
  /*select M.SCHEDULE_TYPE, M.SCHEDULE_SEQUENCE into v_shedule_type, v_schedule_sequence
    from XXEBA_SALES_APPOINTMENT A, XXEBA_SALES_MEETING_SCHEDULE M 
   where A.APPOINTMENT_ID = M.APPOINTMENT_ID 
     and A.CUSTOMER_ID = :CUSTOMER_ID
    and A.APPOINTMENT_ID = 140331703440477668610826674632344421556;
	*/

    select
        m.schedule_type,
        m.schedule_sequence
    into
        v_shedule_type,
        v_schedule_sequence
    from
        xxeba_sales_meeting_schedule m
    where
        m.appointment_id = f_appointment_id;

    v_loop_value := apex_util.string_to_table(v_schedule_sequence, ',');
    for i in 1..v_loop_value.count loop
        if v_shedule_type = 'W' then
            select
                next_day(sysdate,
                         v_loop_value(i))
            into v_date
            from
                dual;

            if v_savedate is null then
                v_savedate := v_date;
            else
                if v_date <= v_savedate then
                    v_savedate := v_date;
                end if;
            end if;

        elsif v_shedule_type = 'M' then
            begin
                select
                    to_date(v_loop_value(i)
                            || '-'
                            || to_char(sysdate, 'MM-YYYY'),
                            'dd-MM-YYYY')
                into v_date
                from
                    dual;

            exception
                when others then
                    v_date := null;
            end;

            if sysdate <= v_date then
                if v_savedate is null then
                    v_savedate := v_date;
                else
                    if v_date <= v_savedate then
                        v_savedate := v_date;
                    end if;
                end if;

            elsif v_savedate is null then
                v_savedate := add_months(to_date(v_loop_value(1)
                                                 || '-'
                                                 || to_char(sysdate, 'MM-YYYY'),
           'DD-MM-YYYY'),
                                         1);
            end if;

        end if; 
		--dbms_output.put_line(v_savedate);
    end loop;

    return v_savedate;
	--dbms_output.put_line(v_savedate);
end;
/


-- sqlcl_snapshot {"hash":"3ff26cac18cb57f17c90760b7bc03beab132d03f","type":"FUNCTION","name":"GET_NEXTAPPOINTMENT","schemaName":"XXVENTURI","sxml":""}