create or replace package body xxventuri.xxebs_msk_appointment_pkg is

    procedure xxeba_schedule_appointment (
        p_appointment_month varchar2
    ) is

        v_first_date        varchar2(100);
        v_month_days        number;
        v_month_start_days  number;
        v_total_appointment number;
        v_limit_existed     varchar2(1);
        v_mothly_cycle      number;
        v_insert_cycle      number;
        v_week_start        number;
        i                   number := 0;
        v_max_api_date      timestamp;
        v_working_days      number;
        cursor reps is
        select
            id,
            meetings_per_day,
            working_days
        from
            eba_sales_salesreps
        where
            status = 'Y';

        c_reps              reps%rowtype;
        cursor cust (
            c_rep_id number
        ) is
        select
            c.id,
            cd.schedule_frequency,
            vf.frequency_days
        from
            eba_sales_customers          c,
            xxeba_sales_customer_details cd,
            xxeba_sales_visit_frequency  vf
        where
                1 = 1
            and c.default_rep_id = c_rep_id
            and cd.customer_id = c.id
            and to_number(cd.visit_frequency_rec) = vf.id
        order by
            c.customer_name;

        c_cust              cust%rowtype;
    begin
        v_first_date := '01-' || p_appointment_month;
        if p_appointment_month = to_char(sysdate, 'MON-YYYY') then
            if to_number ( to_char(sysdate, 'HH') ) > 17 then
                v_first_date := to_char(sysdate + 1, 'DD-MON-YYYY');
            else
                v_first_date := to_char(sysdate, 'DD-MON-YYYY');
            end if;

        end if;

        open reps;
        loop
            fetch reps into c_reps;
            exit when reps%notfound;
            if c_reps.meetings_per_day > 0 then
                open cust(c_reps.id);
                loop
                    v_first_date := '01-' || p_appointment_month;
                    if p_appointment_month = to_char(sysdate, 'MON-YYYY') then
                        if to_number ( to_char(sysdate, 'HH') ) > 17 then
                            v_first_date := to_char(sysdate + 1, 'DD-MON-YYYY');
                        else
                            v_first_date := to_char(sysdate, 'DD-MON-YYYY');
                        end if;

                    end if;

                    fetch cust into c_cust;
                    exit when cust%notfound;
                    select
                        to_number(to_char(
                            last_day(to_date(v_first_date, 'DD-MON-YYYY')),
                            'dd'
                        )),
                        to_number(to_char(to_date(v_first_date, 'DD-MON-YYYY'), 'dd'))
                    into
                        v_month_days,
                        v_month_start_days
                    from
                        dual;

                    if c_cust.schedule_frequency = 'D' then
                        i := 0;
                        for mon in v_month_start_days..v_month_days loop
                            dbms_output.put_line('I '
                                                 || i
                                                 || ' - ' || v_month_days);
						--	EXIT when i>=v_month_days-1;
                            exit when to_date ( v_first_date,
                            'DD-MON-YYYY' ) + i > last_day(to_date('01-'
                                                                   || p_appointment_month, 'DD-MON-YYYY'));

                            select
                                count(*)
                            into v_total_appointment
                            from
                                xxeba_sales_crm_appointments
                            where
                                    trunc(appointment_date) = to_date(v_first_date, 'DD-MON-YYYY') + i
                                and salesrep_id = c_reps.id;

                            if v_total_appointment >= c_reps.meetings_per_day then
                                insert into xxeba_sales_crm_appointments (
                                    customer_id,
                                    appointment_type,
                                    appointment_date,
                                    appointment_purpose,
                                    comments,
                                    appointment_status,
                                    status_comments,
                                    salesrep_id,
                                    appointment_source,
                                    limit_existed,
                                    created_by,
                                    updated_by,
                                    source_application
                                ) values ( c_cust.id,
                                           'Planning',
                                           last_day(to_date(v_first_date
                                                            || '06:00 PM', 'DD-MON-YYYY HH12:MI AM')),
                                           'Direct Visit',
                                           'Scheduled from Account''s Visit Frequency [Limit Exceeded for '
                                           || to_char(to_date(v_first_date, 'DD-MON-YYYY') + i, 'DD-Mon-YYYY')
                                           || ']',
                                           'Scheduled',
                                           null,
                                           c_reps.id,
                                           'P',
                                           'Y',
                                           nvl(
                                               v('APP_USER'),
                                               user
                                           ),
                                           nvl(
                                               v('APP_USER'),
                                               user
                                           ),
                                           'W' );

                            else
                                if v_total_appointment = 0 then
                                    select
                                        count(*)
                                    into v_working_days
                                    from
                                        eba_sales_salesreps
                                    where
                                        working_days like '%'
                                                          || to_char(to_date(v_first_date, 'DD-MON-YYYY') + i, 'DY')
                                                          || ',%'
                                        and id = c_reps.id;

                                    if v_working_days = 0 then
                                        i := i + 1;
                                        select
                                            count(*)
                                        into v_working_days
                                        from
                                            eba_sales_salesreps
                                        where
                                            working_days like '%'
                                                              || to_char(to_date(v_first_date, 'DD-MON-YYYY') + i, 'DY')
                                                              || ',%'
                                            and id = c_reps.id;

                                        if v_working_days = 0 then
                                            i := i + 1;
                                        end if;
                                    end if;

                                    insert into xxeba_sales_crm_appointments (
                                        customer_id,
                                        appointment_type,
                                        appointment_date,
                                        appointment_purpose,
                                        comments,
                                        appointment_status,
                                        status_comments,
                                        salesrep_id,
                                        appointment_source,
                                        limit_existed,
                                        created_by,
                                        updated_by,
                                        source_application
                                    ) values ( c_cust.id,
                                               'Planning',
                                               to_date(v_first_date || '09:00 AM', 'DD-MON-YYYY HH12:MI AM') + i,
                                               'Direct Visit',
                                               'Scheduled from Account''s Visit Frequency ',
                                               'Scheduled',
                                               null,
                                               c_reps.id,
                                               'P',
                                               'N',
                                               nvl(
                                                   v('APP_USER'),
                                                   user
                                               ),
                                               nvl(
                                                   v('APP_USER'),
                                                   user
                                               ),
                                               'W' );

                                else
                                    select
                                        max(appointment_date)
                                    into v_max_api_date
                                    from
                                        xxeba_sales_crm_appointments
                                    where
                                            trunc(appointment_date) = to_date(v_first_date, 'DD-MON-YYYY') + i
                                        and salesrep_id = c_reps.id;

                                    insert into xxeba_sales_crm_appointments (
                                        customer_id,
                                        appointment_type,
                                        appointment_date,
                                        appointment_purpose,
                                        comments,
                                        appointment_status,
                                        status_comments,
                                        salesrep_id,
                                        appointment_source,
                                        limit_existed,
                                        created_by,
                                        updated_by,
                                        source_application
                                    ) values ( c_cust.id,
                                               'Planning',
                                               v_max_api_date + 1 / 24,
                                               'Direct Visit',
                                               'Scheduled from Account''s Visit Frequency ',
                                               'Scheduled',
                                               null,
                                               c_reps.id,
                                               'P',
                                               'N',
                                               nvl(
                                                   v('APP_USER'),
                                                   user
                                               ),
                                               nvl(
                                                   v('APP_USER'),
                                                   user
                                               ),
                                               'W' );

                                end if;
                            end if;

                            i := i + 1;
                        end loop;

                    elsif c_cust.schedule_frequency = 'M' then
                        v_mothly_cycle := c_cust.frequency_days;
                        v_insert_cycle := 0;
					--	for i in 0..v_month_days-1
                        loop
                            exit when to_date ( v_first_date,
                            'DD-MON-YYYY' ) + i > last_day(to_date('01-'
                                                                   || p_appointment_month, 'DD-MON-YYYY'));

                            select
                                count(*)
                            into v_total_appointment
                            from
                                xxeba_sales_crm_appointments
                            where
                                    trunc(appointment_date) = to_date(v_first_date, 'DD-MON-YYYY') + i
                                and salesrep_id = c_reps.id;

                            dbms_output.put_line('Last date ' || last_day(to_date(v_first_date, 'DD-MON-YYYY')));
                            dbms_output.put_line('date ' || v_first_date);
                            if v_total_appointment > c_reps.meetings_per_day then
                                if to_date ( v_first_date,
                                'DD-MON-YYYY' ) + i = last_day(to_date(v_first_date, 'DD-MON-YYYY')) then
                                    insert into xxeba_sales_crm_appointments (
                                        customer_id,
                                        appointment_type,
                                        appointment_date,
                                        appointment_purpose,
                                        comments,
                                        appointment_status,
                                        status_comments,
                                        salesrep_id,
                                        appointment_source,
                                        limit_existed,
                                        created_by,
                                        updated_by,
                                        source_application
                                    ) values ( c_cust.id,
                                               'Planning',
                                               last_day(to_date(v_first_date
                                                                || '06:00 PM', 'DD-MON-YYYY HH12:MI AM')),
                                               'Direct Visit',
                                               'Scheduled from Account''s Visit Frequency ',
                                               'Scheduled',
                                               null,
                                               c_reps.id,
                                               'P',
                                               'Y',
                                               nvl(
                                                   v('APP_USER'),
                                                   user
                                               ),
                                               nvl(
                                                   v('APP_USER'),
                                                   user
                                               ),
                                               'W' );

                                    v_insert_cycle := v_insert_cycle + 1;
                                    if v_mothly_cycle = v_insert_cycle then
                                        exit;
                                    else
                                        i := ( 30 / v_mothly_cycle ) * v_insert_cycle;
                                    end if;

                                else
                                    i := i + 1;
                                end if;

                                dbms_output.put_line('i ' || i);
                            else
                                if v_total_appointment = 0 then
                                    select
                                        count(*)
                                    into v_working_days
                                    from
                                        eba_sales_salesreps
                                    where
                                        working_days like '%'
                                                          || to_char(to_date(v_first_date, 'DD-MON-YYYY') + i, 'DY')
                                                          || ',%'
                                        and id = c_reps.id;

                                    if v_working_days = 0 then
                                        i := i + 1;
                                        select
                                            count(*)
                                        into v_working_days
                                        from
                                            eba_sales_salesreps
                                        where
                                            working_days like '%'
                                                              || to_char(to_date(v_first_date, 'DD-MON-YYYY') + i, 'DY')
                                                              || ',%'
                                            and id = c_reps.id;

                                        if v_working_days = 0 then
                                            i := i + 1;
                                        end if;
                                    end if;

                                    insert into xxeba_sales_crm_appointments (
                                        customer_id,
                                        appointment_type,
                                        appointment_date,
                                        appointment_purpose,
                                        comments,
                                        appointment_status,
                                        status_comments,
                                        salesrep_id,
                                        appointment_source,
                                        limit_existed,
                                        created_by,
                                        updated_by,
                                        source_application
                                    ) values ( c_cust.id,
                                               'Planning',
                                               to_date(v_first_date || '09:00 AM', 'DD-MON-YYYY HH12:MI AM') + i,
                                               'Direct Visit',
                                               'Scheduled from Account''s Visit Frequency ',
                                               'Scheduled',
                                               null,
                                               c_reps.id,
                                               'P',
                                               'N',
                                               nvl(
                                                   v('APP_USER'),
                                                   user
                                               ),
                                               nvl(
                                                   v('APP_USER'),
                                                   user
                                               ),
                                               'W' );

                                else
                                    select
                                        max(appointment_date)
                                    into v_max_api_date
                                    from
                                        xxeba_sales_crm_appointments
                                    where
                                            trunc(appointment_date) = to_date(v_first_date, 'DD-MON-YYYY') + i
                                        and salesrep_id = c_reps.id;

                                    insert into xxeba_sales_crm_appointments (
                                        customer_id,
                                        appointment_type,
                                        appointment_date,
                                        appointment_purpose,
                                        comments,
                                        appointment_status,
                                        status_comments,
                                        salesrep_id,
                                        appointment_source,
                                        limit_existed,
                                        created_by,
                                        updated_by,
                                        source_application
                                    ) values ( c_cust.id,
                                               'Planning',
                                               v_max_api_date + 1 / 24,
                                               'Direct Visit',
                                               'Scheduled from Account''s Visit Frequency ',
                                               'Scheduled',
                                               null,
                                               c_reps.id,
                                               'P',
                                               'N',
                                               nvl(
                                                   v('APP_USER'),
                                                   user
                                               ),
                                               nvl(
                                                   v('APP_USER'),
                                                   user
                                               ),
                                               'W' );

                                end if;

                                dbms_output.put_line('Insert date' || to_char(to_date(v_first_date, 'DD-MON-YYYY') + i, 'DD-MM-YYYY')
                                );

                                v_insert_cycle := v_insert_cycle + 1;
                                if v_mothly_cycle = v_insert_cycle then
                                    exit;
                                else
                                    i := ( 30 / v_mothly_cycle ) * v_insert_cycle;
                                end if;

                            end if;

                            dbms_output.put_line('i ' || i);
						--	i := i+1;
                        end loop;

                    elsif c_cust.schedule_frequency = 'W' then
                        v_mothly_cycle := c_cust.frequency_days;
                        v_insert_cycle := 0;
                        i := 0;
                        for week in 0..3 loop
                            exit when to_date ( v_first_date,
                            'DD-MON-YYYY' ) + i > last_day(to_date('01-'
                                                                   || p_appointment_month, 'DD-MON-YYYY'));
				--v_mothly_cycle := c_cust.FREQUENCY_DAYS;
                            v_insert_cycle := 0;
                            v_month_days := to_number ( to_char(
                                last_day(trunc(to_date(v_first_date, 'DD-MON-YYYY'), 'iw') + 6),
                                'dd'
                            ) );

                            v_week_start := to_number ( to_char(to_date(v_first_date, 'DD-MON-YYYY'), 'dd') );
							--i:=v_week_start;
                            i := 0;
							--for i in v_week_start-1..v_month_days-1
                            loop
                                exit when to_date ( v_first_date,
                                'DD-MON-YYYY' ) + i > trunc(to_date(v_first_date, 'DD-MON-YYYY'), 'iw') + 6;
							--	EXIT when i=v_month_days-1;
                                select
                                    count(*)
                                into v_total_appointment
                                from
                                    xxeba_sales_crm_appointments
                                where
                                        trunc(appointment_date) = to_date(v_first_date, 'DD-MON-YYYY') + i
                                    and salesrep_id = c_reps.id;

                                if v_total_appointment > c_reps.meetings_per_day then
                                    if to_date ( v_first_date,
                                    'DD-MON-YYYY' ) + i = last_day(to_date(v_first_date, 'DD-MON-YYYY')) then
                                        insert into xxeba_sales_crm_appointments (
                                            customer_id,
                                            appointment_type,
                                            appointment_date,
                                            appointment_purpose,
                                            comments,
                                            appointment_status,
                                            status_comments,
                                            salesrep_id,
                                            appointment_source,
                                            limit_existed,
                                            created_by,
                                            updated_by,
                                            source_application
                                        ) values ( c_cust.id,
                                                   'Planning',
                                                   to_date(to_char(trunc(to_date(v_first_date, 'DD-MON-YYYY'), 'iw') + 6,
                                                                   'DD-MON-YYYY')
                                                           || '06:00 PM',
                                                           'DD-MON-YYYY HH12:MI AM'),
                                                   'Direct Visit',
                                                   'Scheduled from Account''s Visit Frequency ',
                                                   'Scheduled',
                                                   null,
                                                   c_reps.id,
                                                   'P',
                                                   'Y',
                                                   nvl(
                                                       v('APP_USER'),
                                                       user
                                                   ),
                                                   nvl(
                                                       v('APP_USER'),
                                                       user
                                                   ),
                                                   'W' );

                                        v_insert_cycle := v_insert_cycle + 1;
                                        if v_mothly_cycle = v_insert_cycle then
                                            v_first_date := to_char(to_date(v_first_date, 'DD-MON-YYYY') + 7, 'DD-MON-YYYY');
                                            exit;
                                        else
                                            i := i + trunc((7 / v_mothly_cycle) * v_insert_cycle) + 1;
                                        end if;

                                    else
                                        i := i + 1;
                                    end if;
                                else
                                    if v_total_appointment = 0 then
                                        select
                                            count(*)
                                        into v_working_days
                                        from
                                            eba_sales_salesreps
                                        where
                                            working_days like '%'
                                                              || to_char(to_date(v_first_date, 'DD-MON-YYYY') + i, 'DY')
                                                              || ',%'
                                            and id = c_reps.id;

                                        if v_working_days = 0 then
                                            i := i + 1;
                                            select
                                                count(*)
                                            into v_working_days
                                            from
                                                eba_sales_salesreps
                                            where
                                                working_days like '%'
                                                                  || to_char(to_date(v_first_date, 'DD-MON-YYYY') + i, 'DY')
                                                                  || ',%'
                                                and id = c_reps.id;

                                            if v_working_days = 0 then
                                                i := i + 1;
                                            end if;
                                        end if;

                                        insert into xxeba_sales_crm_appointments (
                                            customer_id,
                                            appointment_type,
                                            appointment_date,
                                            appointment_purpose,
                                            comments,
                                            appointment_status,
                                            status_comments,
                                            salesrep_id,
                                            appointment_source,
                                            limit_existed,
                                            created_by,
                                            updated_by,
                                            source_application
                                        ) values ( c_cust.id,
                                                   'Planning',
                                                   to_date(v_first_date || '09:00 AM', 'DD-MON-YYYY HH12:MI AM') + i,
                                                   'Direct Visit',
                                                   'Scheduled from Account''s Visit Frequency ',
                                                   'Scheduled',
                                                   null,
                                                   c_reps.id,
                                                   'P',
                                                   'N',
                                                   nvl(
                                                       v('APP_USER'),
                                                       user
                                                   ),
                                                   nvl(
                                                       v('APP_USER'),
                                                       user
                                                   ),
                                                   'W' );

                                    else
                                        select
                                            max(appointment_date)
                                        into v_max_api_date
                                        from
                                            xxeba_sales_crm_appointments
                                        where
                                                trunc(appointment_date) = to_date(v_first_date, 'DD-MON-YYYY') + i
                                            and salesrep_id = c_reps.id;

                                        insert into xxeba_sales_crm_appointments (
                                            customer_id,
                                            appointment_type,
                                            appointment_date,
                                            appointment_purpose,
                                            comments,
                                            appointment_status,
                                            status_comments,
                                            salesrep_id,
                                            appointment_source,
                                            limit_existed,
                                            created_by,
                                            updated_by,
                                            source_application
                                        ) values ( c_cust.id,
                                                   'Planning',
                                                   v_max_api_date + 1 / 24,
                                                   'Direct Visit',
                                                   'Scheduled from Account''s Visit Frequency ',
                                                   'Scheduled',
                                                   null,
                                                   c_reps.id,
                                                   'P',
                                                   'N',
                                                   nvl(
                                                       v('APP_USER'),
                                                       user
                                                   ),
                                                   nvl(
                                                       v('APP_USER'),
                                                       user
                                                   ),
                                                   'W' );

                                    end if;

                                    v_insert_cycle := v_insert_cycle + 1;
                                    if v_mothly_cycle = v_insert_cycle then
                                        v_first_date := to_char(to_date(v_first_date, 'DD-MON-YYYY') + 7, 'DD-MON-YYYY');
                                        exit;
                                    else
                                        i := i + trunc((7 / v_mothly_cycle) * v_insert_cycle);
                                    end if;

                                end if;

                                i := i + 1;
                            end loop;

                        end loop;

                    end if;

                end loop;

                close cust;
            end if;

        end loop;

        close reps;
    end xxeba_schedule_appointment;

end xxebs_msk_appointment_pkg;
/


-- sqlcl_snapshot {"hash":"a3e6b1af3460fe693bc509fb4db3cee9f106130e","type":"PACKAGE_BODY","name":"XXEBS_MSK_APPOINTMENT_PKG","schemaName":"XXVENTURI","sxml":""}