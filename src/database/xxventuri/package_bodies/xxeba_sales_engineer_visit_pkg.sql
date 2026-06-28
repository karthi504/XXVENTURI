create or replace package body xxventuri.xxeba_sales_engineer_visit_pkg as 
 
/* Daily */
    procedure daily_visit (
        p_appointment_month varchar2
    ) is

        lv_appt_count number;
        cursor reps is
        select
            *
        from
            eba_sales_salesreps
        where
            status = 'Y';

        cursor cust (
            lv_rep_id number
        ) is
        select
            c.id,
            c.default_rep_id,
            decode(vf.visit_frequency, 'Monthly Once', 1, 'Monthly Twice', 2,
                   'Monthly Thrice', 3, 'Weekly Once', 4, 'Weekly Twice',
                   8, 'Daily', 31) days,
            sr.meetings_per_day,
            sr.working_days,
            cd.schedule_frequency,
            vf.frequency_days,
            vf.visit_frequency
        from
            eba_sales_customers          c,
            xxeba_sales_customer_details cd,
            xxeba_sales_visit_frequency  vf,
            eba_sales_salesreps          sr
        where
                c.default_rep_id = sr.id
            and cd.customer_id = c.id
            and c.status = 'A'
            and sr.status = 'Y'
            and to_number(cd.visit_frequency_rec) = vf.id
            and c.default_rep_id = lv_rep_id;

        cursor work_days is
        select
            *
        from
            (
                select
                    day,
                    rownum as seq_num
                from
                    (
                        select
                            trunc(sysdate, 'MM') + level - 1 as day
                        from
                            dual
                        where
                                ( trunc(sysdate, 'MM') + level - 1 ) >= trunc(sysdate)
                            and upper(to_char(sysdate, 'Mon-YYYY')) = upper(p_appointment_month)
                        connect by
                            trunc(trunc(sysdate, 'MM') + level - 1,
                                  'MM') = trunc(sysdate, 'MM')
                        minus
                        select
                            dy as day
                        from
                            (
                                select
                                    *
                                from
                                    (
                                        select
                                            trunc(to_date('01-'
                                                          || p_appointment_month, 'DD-MON-YYYY'), 'mm') + level - 1 dy
                                        from
                                            dual
                                        connect by
                                            level < ( trunc(
                                                add_months(to_date('01-'
                                                                   || p_appointment_month, 'DD-MON-YYYY'), 1),
                                                'mm'
                                            ) - trunc(to_date('01-'
                                                              || p_appointment_month, 'DD-MON-YYYY'), 'mm') ) + 1
                                    )
                                where
                                    to_char(dy, 'd') = 1
                                union all
                                select
                                    holiday_date
                                from
                                    xxeba_sales_holidays_t
                                where
                                        status = 'Y'
                                    and upper(to_char(holiday_date, 'Mon-YYYY')) = upper(p_appointment_month)
                            )
                    )
            );

    begin
        for r_reps in reps loop
            for r_cust in cust(r_reps.id) loop
                if r_cust.days = 31 then  
 
-- First Week Dates-- 
                    for r_workday in (
                        select
                            *
                        from
                            (
                                select
                                    day,
                                    rownum as seq_num
                                from
                                    (
                                        select
                                            trunc(sysdate, 'MM') + level - 1 as day
                                        from
                                            dual
                                        where
                                                ( trunc(sysdate, 'MM') + level - 1 ) >= trunc(sysdate)
                                            and upper(to_char(sysdate, 'Mon-YYYY')) = upper(p_appointment_month)
                                        connect by
                                            trunc(trunc(sysdate, 'MM') + level - 1,
                                                  'MM') = trunc(sysdate, 'MM')
                                        minus
                                        select
                                            dy as day
                                        from
                                            (
                                                select
                                                    *
                                                from
                                                    (
                                                        select
                                                            trunc(to_date('01-'
                                                                          || p_appointment_month, 'DD-MON-YYYY'), 'mm') + level - 1 dy
                                                        from
                                                            dual
                                                        connect by
                                                            level < ( trunc(
                                                                add_months(to_date('01-'
                                                                                   || p_appointment_month, 'DD-MON-YYYY'), 1),
                                                                'mm'
                                                            ) - trunc(to_date('01-'
                                                                              || p_appointment_month, 'DD-MON-YYYY'), 'mm') ) + 1
                                                    )
                                                where
                                                    to_char(dy, 'd') = 1
                                                union all
                                                select
                                                    holiday_date
                                                from
                                                    xxeba_sales_holidays_t
                                                where
                                                        status = 'Y'
                                                    and upper(to_char(holiday_date, 'Mon-YYYY')) = upper(p_appointment_month)
                                            )
                                    )
                            )
                        where
                            seq_num between 1 and 31
                    ) loop
                        select
                            count(*)
                        into lv_appt_count
                        from
                            xxeba_sales_crm_appointments
                        where
                                to_date(trunc(appointment_date),
                                        'DD-Mon-YYYY') = to_date(r_workday.day, 'DD-Mon-YYYY')
                            and salesrep_id = r_cust.default_rep_id;

                        if lv_appt_count < r_cust.meetings_per_day then
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
                            ) values ( r_cust.id,
                                       'Planning',
                                       r_workday.day,
                                       'Direct Visit',
                                       'Scheduled from Account''s Visit Frequency',
                                       'Scheduled',
                                       null,
                                       r_cust.default_rep_id,
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

                            commit;
                        end if;

                    end loop;

                end if;
            end loop;
        end loop;
    end daily_visit; 
	   
 
/* Monthly Once */
    procedure monthly_once_visit (
        p_appointment_month varchar2
    ) is

        lv_appt_count number;
        cursor reps is
        select
            *
        from
            eba_sales_salesreps
        where
            status = 'Y';

        cursor cust (
            lv_rep_id number
        ) is
        select
            c.id,
            c.default_rep_id,
            decode(vf.visit_frequency, 'Monthly Once', 1, 'Monthly Twice', 2,
                   'Monthly Thrice', 3, 'Weekly Once', 4, 'Weekly Twice',
                   8, 'Daily', 20) days,
            sr.meetings_per_day,
            sr.working_days,
            cd.schedule_frequency,
            vf.frequency_days,
            vf.visit_frequency
        from
            eba_sales_customers          c,
            xxeba_sales_customer_details cd,
            xxeba_sales_visit_frequency  vf,
            eba_sales_salesreps          sr
        where
                c.default_rep_id = sr.id
            and cd.customer_id = c.id
            and c.status = 'A'
            and sr.status = 'Y'
            and to_number(cd.visit_frequency_rec) = vf.id
            and c.default_rep_id = lv_rep_id;

        cursor work_days is
        select
            *
        from
            (
                select
                    day,
                    rownum as seq_num
                from
                    (
                        select
                            trunc(sysdate, 'MM') + level - 1 as day
                        from
                            dual
                        where
                                ( trunc(sysdate, 'MM') + level - 1 ) >= trunc(sysdate)
                            and upper(to_char(sysdate, 'Mon-YYYY')) = upper(p_appointment_month)
                        connect by
                            trunc(trunc(sysdate, 'MM') + level - 1,
                                  'MM') = trunc(sysdate, 'MM')
                        minus
                        select
                            dy as day
                        from
                            (
                                select
                                    *
                                from
                                    (
                                        select
                                            trunc(to_date('01-'
                                                          || p_appointment_month, 'DD-MON-YYYY'), 'mm') + level - 1 dy
                                        from
                                            dual
                                        connect by
                                            level < ( trunc(
                                                add_months(to_date('01-'
                                                                   || p_appointment_month, 'DD-MON-YYYY'), 1),
                                                'mm'
                                            ) - trunc(to_date('01-'
                                                              || p_appointment_month, 'DD-MON-YYYY'), 'mm') ) + 1
                                    )
                                where
                                    to_char(dy, 'd') = 1
                                union all
                                select
                                    holiday_date
                                from
                                    xxeba_sales_holidays_t
                                where
                                        status = 'Y'
                                    and upper(to_char(holiday_date, 'Mon-YYYY')) = upper(p_appointment_month)
                            )
                    )
            );

    begin
        for r_reps in reps loop
            for r_cust in cust(r_reps.id) loop
                if r_cust.days = 1 then  
 
-- First Week Dates-- 
                    for r_workday in (
                        select
                            *
                        from
                            (
                                select
                                    day,
                                    rownum as seq_num
                                from
                                    (
                                        select
                                            trunc(sysdate, 'MM') + level - 1 as day
                                        from
                                            dual
                                        where
                                                ( trunc(sysdate, 'MM') + level - 1 ) >= trunc(sysdate)
                                            and upper(to_char(sysdate, 'Mon-YYYY')) = upper(p_appointment_month)
                                        connect by
                                            trunc(trunc(sysdate, 'MM') + level - 1,
                                                  'MM') = trunc(sysdate, 'MM')
                                        minus
                                        select
                                            dy as day
                                        from
                                            (
                                                select
                                                    *
                                                from
                                                    (
                                                        select
                                                            trunc(to_date('01-'
                                                                          || p_appointment_month, 'DD-MON-YYYY'), 'mm') + level - 1 dy
                                                        from
                                                            dual
                                                        connect by
                                                            level < ( trunc(
                                                                add_months(to_date('01-'
                                                                                   || p_appointment_month, 'DD-MON-YYYY'), 1),
                                                                'mm'
                                                            ) - trunc(to_date('01-'
                                                                              || p_appointment_month, 'DD-MON-YYYY'), 'mm') ) + 1
                                                    )
                                                where
                                                    to_char(dy, 'd') = 1
                                                union all
                                                select
                                                    holiday_date
                                                from
                                                    xxeba_sales_holidays_t
                                                where
                                                        status = 'Y'
                                                    and upper(to_char(holiday_date, 'Mon-YYYY')) = upper(p_appointment_month)
                                            )
                                    )
                            )
                        where
                            seq_num in ( 6 )
                    ) loop
                        select
                            count(*)
                        into lv_appt_count
                        from
                            xxeba_sales_crm_appointments
                        where
                                to_date(trunc(appointment_date),
                                        'DD-Mon-YYYY') = to_date(r_workday.day, 'DD-Mon-YYYY')
                            and salesrep_id = r_cust.default_rep_id;

                        if lv_appt_count < r_cust.meetings_per_day then
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
                            ) values ( r_cust.id,
                                       'Planning',
                                       r_workday.day,
                                       'Direct Visit',
                                       'Scheduled from Account''s Visit Frequency',
                                       'Scheduled',
                                       null,
                                       r_cust.default_rep_id,
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

                            commit;
                        end if;

                    end loop;

                end if;
            end loop;
        end loop;
    end monthly_once_visit; 
	   
	   
	   
/* Monthly Twice */
    procedure monthly_twice_visit (
        p_appointment_month varchar2
    ) is

        lv_appt_count number;
        cursor reps is
        select
            *
        from
            eba_sales_salesreps
        where
            status = 'Y';

        cursor cust (
            lv_rep_id number
        ) is
        select
            c.id,
            c.default_rep_id,
            decode(vf.visit_frequency, 'Monthly Once', 1, 'Monthly Twice', 2,
                   'Monthly Thrice', 3, 'Weekly Once', 4, 'Weekly Twice',
                   8, 'Daily', 20) days,
            sr.meetings_per_day,
            sr.working_days,
            cd.schedule_frequency,
            vf.frequency_days,
            vf.visit_frequency
        from
            eba_sales_customers          c,
            xxeba_sales_customer_details cd,
            xxeba_sales_visit_frequency  vf,
            eba_sales_salesreps          sr
        where
                c.default_rep_id = sr.id
            and cd.customer_id = c.id
            and c.status = 'A'
            and sr.status = 'Y'
            and to_number(cd.visit_frequency_rec) = vf.id
            and c.default_rep_id = lv_rep_id;

        cursor work_days is
        select
            *
        from
            (
                select
                    day,
                    rownum as seq_num
                from
                    (
                        select
                            trunc(sysdate, 'MM') + level - 1 as day
                        from
                            dual
                        where
                                ( trunc(sysdate, 'MM') + level - 1 ) >= trunc(sysdate)
                            and upper(to_char(sysdate, 'Mon-YYYY')) = upper(p_appointment_month)
                        connect by
                            trunc(trunc(sysdate, 'MM') + level - 1,
                                  'MM') = trunc(sysdate, 'MM')
                        minus
                        select
                            dy as day
                        from
                            (
                                select
                                    *
                                from
                                    (
                                        select
                                            trunc(to_date('01-'
                                                          || p_appointment_month, 'DD-MON-YYYY'), 'mm') + level - 1 dy
                                        from
                                            dual
                                        connect by
                                            level < ( trunc(
                                                add_months(to_date('01-'
                                                                   || p_appointment_month, 'DD-MON-YYYY'), 1),
                                                'mm'
                                            ) - trunc(to_date('01-'
                                                              || p_appointment_month, 'DD-MON-YYYY'), 'mm') ) + 1
                                    )
                                where
                                    to_char(dy, 'd') = 1
                                union all
                                select
                                    holiday_date
                                from
                                    xxeba_sales_holidays_t
                                where
                                        status = 'Y'
                                    and upper(to_char(holiday_date, 'Mon-YYYY')) = upper(p_appointment_month)
                            )
                    )
            );

    begin
        for r_reps in reps loop
            for r_cust in cust(r_reps.id) loop
                if r_cust.days = 2 then  
 
-- First Week Dates-- 
                    for r_workday in (
                        select
                            *
                        from
                            (
                                select
                                    day,
                                    rownum as seq_num
                                from
                                    (
                                        select
                                            trunc(sysdate, 'MM') + level - 1 as day
                                        from
                                            dual
                                        where
                                                ( trunc(sysdate, 'MM') + level - 1 ) >= trunc(sysdate)
                                            and upper(to_char(sysdate, 'Mon-YYYY')) = upper(p_appointment_month)
                                        connect by
                                            trunc(trunc(sysdate, 'MM') + level - 1,
                                                  'MM') = trunc(sysdate, 'MM')
                                        minus
                                        select
                                            dy as day
                                        from
                                            (
                                                select
                                                    *
                                                from
                                                    (
                                                        select
                                                            trunc(to_date('01-'
                                                                          || p_appointment_month, 'DD-MON-YYYY'), 'mm') + level - 1 dy
                                                        from
                                                            dual
                                                        connect by
                                                            level < ( trunc(
                                                                add_months(to_date('01-'
                                                                                   || p_appointment_month, 'DD-MON-YYYY'), 1),
                                                                'mm'
                                                            ) - trunc(to_date('01-'
                                                                              || p_appointment_month, 'DD-MON-YYYY'), 'mm') ) + 1
                                                    )
                                                where
                                                    to_char(dy, 'd') = 1
                                                union all
                                                select
                                                    holiday_date
                                                from
                                                    xxeba_sales_holidays_t
                                                where
                                                        status = 'Y'
                                                    and upper(to_char(holiday_date, 'Mon-YYYY')) = upper(p_appointment_month)
                                            )
                                    )
                            )
                        where
                            seq_num in ( 5, 21 )
                    ) loop
                        select
                            count(*)
                        into lv_appt_count
                        from
                            xxeba_sales_crm_appointments
                        where
                                to_date(trunc(appointment_date),
                                        'DD-Mon-YYYY') = to_date(r_workday.day, 'DD-Mon-YYYY')
                            and salesrep_id = r_cust.default_rep_id;

                        if lv_appt_count < r_cust.meetings_per_day then
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
                            ) values ( r_cust.id,
                                       'Planning',
                                       r_workday.day,
                                       'Direct Visit',
                                       'Scheduled from Account''s Visit Frequency',
                                       'Scheduled',
                                       null,
                                       r_cust.default_rep_id,
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

                            commit;
                        end if;

                    end loop;

                end if;
            end loop;
        end loop;
    end monthly_twice_visit;

    procedure monthly_thrice_visit (
        p_appointment_month varchar2
    ) is

        lv_appt_count number;
        cursor reps is
        select
            *
        from
            eba_sales_salesreps
        where
            status = 'Y';

        cursor cust (
            lv_rep_id number
        ) is
        select
            c.id,
            c.default_rep_id,
            decode(vf.visit_frequency, 'Monthly Once', 1, 'Monthly Twice', 2,
                   'Monthly Thrice', 3, 'Weekly Once', 4, 'Weekly Twice',
                   8, 'Daily', 20) days,
            sr.meetings_per_day,
            sr.working_days,
            cd.schedule_frequency,
            vf.frequency_days,
            vf.visit_frequency
        from
            eba_sales_customers          c,
            xxeba_sales_customer_details cd,
            xxeba_sales_visit_frequency  vf,
            eba_sales_salesreps          sr
        where
                c.default_rep_id = sr.id
            and cd.customer_id = c.id
            and c.status = 'A'
            and sr.status = 'Y'
            and to_number(cd.visit_frequency_rec) = vf.id
            and c.default_rep_id = lv_rep_id;

        cursor work_days is
        select
            *
        from
            (
                select
                    day,
                    rownum as seq_num
                from
                    (
                        select
                            trunc(sysdate, 'MM') + level - 1 as day
                        from
                            dual
                        where
                                ( trunc(sysdate, 'MM') + level - 1 ) >= trunc(sysdate)
                            and upper(to_char(sysdate, 'Mon-YYYY')) = upper(p_appointment_month)
                        connect by
                            trunc(trunc(sysdate, 'MM') + level - 1,
                                  'MM') = trunc(sysdate, 'MM')
                        minus
                        select
                            dy as day
                        from
                            (
                                select
                                    *
                                from
                                    (
                                        select
                                            trunc(to_date('01-'
                                                          || p_appointment_month, 'DD-MON-YYYY'), 'mm') + level - 1 dy
                                        from
                                            dual
                                        connect by
                                            level < ( trunc(
                                                add_months(to_date('01-'
                                                                   || p_appointment_month, 'DD-MON-YYYY'), 1),
                                                'mm'
                                            ) - trunc(to_date('01-'
                                                              || p_appointment_month, 'DD-MON-YYYY'), 'mm') ) + 1
                                    )
                                where
                                    to_char(dy, 'd') = 1
                                union all
                                select
                                    holiday_date
                                from
                                    xxeba_sales_holidays_t
                                where
                                        status = 'Y'
                                    and upper(to_char(holiday_date, 'Mon-YYYY')) = upper(p_appointment_month)
                            )
                    )
            );

    begin
        for r_reps in reps loop
            for r_cust in cust(r_reps.id) loop
                if r_cust.days = 3 then  
 
-- First Week Dates-- 
                    for r_workday in (
                        select
                            *
                        from
                            (
                                select
                                    day,
                                    rownum as seq_num
                                from
                                    (
                                        select
                                            trunc(sysdate, 'MM') + level - 1 as day
                                        from
                                            dual
                                        where
                                                ( trunc(sysdate, 'MM') + level - 1 ) >= trunc(sysdate)
                                            and upper(to_char(sysdate, 'Mon-YYYY')) = upper(p_appointment_month)
                                        connect by
                                            trunc(trunc(sysdate, 'MM') + level - 1,
                                                  'MM') = trunc(sysdate, 'MM')
                                        minus
                                        select
                                            dy as day
                                        from
                                            (
                                                select
                                                    *
                                                from
                                                    (
                                                        select
                                                            trunc(to_date('01-'
                                                                          || p_appointment_month, 'DD-MON-YYYY'), 'mm') + level - 1 dy
                                                        from
                                                            dual
                                                        connect by
                                                            level < ( trunc(
                                                                add_months(to_date('01-'
                                                                                   || p_appointment_month, 'DD-MON-YYYY'), 1),
                                                                'mm'
                                                            ) - trunc(to_date('01-'
                                                                              || p_appointment_month, 'DD-MON-YYYY'), 'mm') ) + 1
                                                    )
                                                where
                                                    to_char(dy, 'd') = 1
                                                union all
                                                select
                                                    holiday_date
                                                from
                                                    xxeba_sales_holidays_t
                                                where
                                                        status = 'Y'
                                                    and upper(to_char(holiday_date, 'Mon-YYYY')) = upper(p_appointment_month)
                                            )
                                    )
                            )
                        where
                            seq_num in ( 3, 11, 23 )
                    ) loop
                        select
                            count(*)
                        into lv_appt_count
                        from
                            xxeba_sales_crm_appointments
                        where
                                to_date(trunc(appointment_date),
                                        'DD-Mon-YYYY') = to_date(r_workday.day, 'DD-Mon-YYYY')
                            and salesrep_id = r_cust.default_rep_id;

                        if lv_appt_count < r_cust.meetings_per_day then
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
                            ) values ( r_cust.id,
                                       'Planning',
                                       r_workday.day,
                                       'Direct Visit',
                                       'Scheduled from Account''s Visit Frequency',
                                       'Scheduled',
                                       null,
                                       r_cust.default_rep_id,
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

                            commit;
                        end if;

                    end loop;

                end if;
            end loop;
        end loop;
    end monthly_thrice_visit;

    procedure weekly_once_visit (
        p_appointment_month varchar2
    ) is

        lv_appt_count number;
        cursor reps is
        select
            *
        from
            eba_sales_salesreps
        where
            status = 'Y';

        cursor cust (
            lv_rep_id number
        ) is
        select
            c.id,
            c.default_rep_id,
            decode(vf.visit_frequency, 'Monthly Once', 1, 'Monthly Twice', 2,
                   'Monthly Thrice', 3, 'Weekly Once', 4, 'Weekly Twice',
                   8, 'Daily', 20) days,
            sr.meetings_per_day,
            sr.working_days,
            cd.schedule_frequency,
            vf.frequency_days,
            vf.visit_frequency
        from
            eba_sales_customers          c,
            xxeba_sales_customer_details cd,
            xxeba_sales_visit_frequency  vf,
            eba_sales_salesreps          sr
        where
                c.default_rep_id = sr.id
            and cd.customer_id = c.id
            and c.status = 'A'
            and sr.status = 'Y'
            and to_number(cd.visit_frequency_rec) = vf.id
            and c.default_rep_id = lv_rep_id;

        cursor work_days is
        select
            *
        from
            (
                select
                    day,
                    rownum as seq_num
                from
                    (
                        select
                            trunc(sysdate, 'MM') + level - 1 as day
                        from
                            dual
                        where
                                ( trunc(sysdate, 'MM') + level - 1 ) >= trunc(sysdate)
                            and upper(to_char(sysdate, 'Mon-YYYY')) = upper(p_appointment_month)
                        connect by
                            trunc(trunc(sysdate, 'MM') + level - 1,
                                  'MM') = trunc(sysdate, 'MM')
                        minus
                        select
                            dy as day
                        from
                            (
                                select
                                    *
                                from
                                    (
                                        select
                                            trunc(to_date('01-'
                                                          || p_appointment_month, 'DD-MON-YYYY'), 'mm') + level - 1 dy
                                        from
                                            dual
                                        connect by
                                            level < ( trunc(
                                                add_months(to_date('01-'
                                                                   || p_appointment_month, 'DD-MON-YYYY'), 1),
                                                'mm'
                                            ) - trunc(to_date('01-'
                                                              || p_appointment_month, 'DD-MON-YYYY'), 'mm') ) + 1
                                    )
                                where
                                    to_char(dy, 'd') = 1
                                union all
                                select
                                    holiday_date
                                from
                                    xxeba_sales_holidays_t
                                where
                                        status = 'Y'
                                    and upper(to_char(holiday_date, 'Mon-YYYY')) = upper(p_appointment_month)
                            )
                    )
            );

    begin
        for r_reps in reps loop
            for r_cust in cust(r_reps.id) loop
                if r_cust.days = 4 then  
 
-- First Week Dates-- 
                    for r_workday in (
                        select
                            *
                        from
                            (
                                select
                                    day,
                                    rownum as seq_num
                                from
                                    (
                                        select
                                            trunc(sysdate, 'MM') + level - 1 as day
                                        from
                                            dual
                                        where
                                                ( trunc(sysdate, 'MM') + level - 1 ) >= trunc(sysdate)
                                            and upper(to_char(sysdate, 'Mon-YYYY')) = upper(p_appointment_month)
                                        connect by
                                            trunc(trunc(sysdate, 'MM') + level - 1,
                                                  'MM') = trunc(sysdate, 'MM')
                                        minus
                                        select
                                            dy as day
                                        from
                                            (
                                                select
                                                    *
                                                from
                                                    (
                                                        select
                                                            trunc(to_date('01-'
                                                                          || p_appointment_month, 'DD-MON-YYYY'), 'mm') + level - 1 dy
                                                        from
                                                            dual
                                                        connect by
                                                            level < ( trunc(
                                                                add_months(to_date('01-'
                                                                                   || p_appointment_month, 'DD-MON-YYYY'), 1),
                                                                'mm'
                                                            ) - trunc(to_date('01-'
                                                                              || p_appointment_month, 'DD-MON-YYYY'), 'mm') ) + 1
                                                    )
                                                where
                                                    to_char(dy, 'd') = 1
                                                union all
                                                select
                                                    holiday_date
                                                from
                                                    xxeba_sales_holidays_t
                                                where
                                                        status = 'Y'
                                                    and upper(to_char(holiday_date, 'Mon-YYYY')) = upper(p_appointment_month)
                                            )
                                    )
                            )
                        where
                            seq_num in ( 2, 9, 19, 25 )
                    ) loop
                        select
                            count(*)
                        into lv_appt_count
                        from
                            xxeba_sales_crm_appointments
                        where
                                to_date(trunc(appointment_date),
                                        'DD-Mon-YYYY') = to_date(r_workday.day, 'DD-Mon-YYYY')
                            and salesrep_id = r_cust.default_rep_id;

                        if lv_appt_count < r_cust.meetings_per_day then
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
                            ) values ( r_cust.id,
                                       'Planning',
                                       r_workday.day,
                                       'Direct Visit',
                                       'Scheduled from Account''s Visit Frequency',
                                       'Scheduled',
                                       null,
                                       r_cust.default_rep_id,
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

                            commit;
                        end if;

                    end loop;

                end if;
            end loop;
        end loop;
    end weekly_once_visit;

    procedure wekkly_twice_visit (
        p_appointment_month varchar2
    ) is

        lv_appt_count number;
        cursor reps is
        select
            *
        from
            eba_sales_salesreps
        where
            status = 'Y';

        cursor cust (
            lv_rep_id number
        ) is
        select
            c.id,
            c.default_rep_id,
            decode(vf.visit_frequency, 'Monthly Once', 1, 'Monthly Twice', 2,
                   'Monthly Thrice', 3, 'Weekly Once', 4, 'Weekly Twice',
                   8, 'Daily', 20) days,
            sr.meetings_per_day,
            sr.working_days,
            cd.schedule_frequency,
            vf.frequency_days,
            vf.visit_frequency
        from
            eba_sales_customers          c,
            xxeba_sales_customer_details cd,
            xxeba_sales_visit_frequency  vf,
            eba_sales_salesreps          sr
        where
                c.default_rep_id = sr.id
            and cd.customer_id = c.id
            and c.status = 'A'
            and sr.status = 'Y'
            and to_number(cd.visit_frequency_rec) = vf.id
            and c.default_rep_id = lv_rep_id;

        cursor work_days is
        select
            *
        from
            (
                select
                    day,
                    rownum as seq_num
                from
                    (
                        select
                            trunc(sysdate, 'MM') + level - 1 as day
                        from
                            dual
                        where
                                ( trunc(sysdate, 'MM') + level - 1 ) >= trunc(sysdate)
                            and upper(to_char(sysdate, 'Mon-YYYY')) = upper(p_appointment_month)
                        connect by
                            trunc(trunc(sysdate, 'MM') + level - 1,
                                  'MM') = trunc(sysdate, 'MM')
                        minus
                        select
                            dy as day
                        from
                            (
                                select
                                    *
                                from
                                    (
                                        select
                                            trunc(to_date('01-'
                                                          || p_appointment_month, 'DD-MON-YYYY'), 'mm') + level - 1 dy
                                        from
                                            dual
                                        connect by
                                            level < ( trunc(
                                                add_months(to_date('01-'
                                                                   || p_appointment_month, 'DD-MON-YYYY'), 1),
                                                'mm'
                                            ) - trunc(to_date('01-'
                                                              || p_appointment_month, 'DD-MON-YYYY'), 'mm') ) + 1
                                    )
                                where
                                    to_char(dy, 'd') = 1
                                union all
                                select
                                    holiday_date
                                from
                                    xxeba_sales_holidays_t
                                where
                                        status = 'Y'
                                    and upper(to_char(holiday_date, 'Mon-YYYY')) = upper(p_appointment_month)
                            )
                    )
            );

    begin
        for r_reps in reps loop
            for r_cust in cust(r_reps.id) loop
                if r_cust.days = 8 then  
 
-- First Week Dates-- 
                    for r_workday in (
                        select
                            *
                        from
                            (
                                select
                                    day,
                                    rownum as seq_num
                                from
                                    (
                                        select
                                            trunc(sysdate, 'MM') + level - 1 as day
                                        from
                                            dual
                                        where
                                                ( trunc(sysdate, 'MM') + level - 1 ) >= trunc(sysdate)
                                            and upper(to_char(sysdate, 'Mon-YYYY')) = upper(p_appointment_month)
                                        connect by
                                            trunc(trunc(sysdate, 'MM') + level - 1,
                                                  'MM') = trunc(sysdate, 'MM')
                                        minus
                                        select
                                            dy as day
                                        from
                                            (
                                                select
                                                    *
                                                from
                                                    (
                                                        select
                                                            trunc(to_date('01-'
                                                                          || p_appointment_month, 'DD-MON-YYYY'), 'mm') + level - 1 dy
                                                        from
                                                            dual
                                                        connect by
                                                            level < ( trunc(
                                                                add_months(to_date('01-'
                                                                                   || p_appointment_month, 'DD-MON-YYYY'), 1),
                                                                'mm'
                                                            ) - trunc(to_date('01-'
                                                                              || p_appointment_month, 'DD-MON-YYYY'), 'mm') ) + 1
                                                    )
                                                where
                                                    to_char(dy, 'd') = 1
                                                union all
                                                select
                                                    holiday_date
                                                from
                                                    xxeba_sales_holidays_t
                                                where
                                                        status = 'Y'
                                                    and upper(to_char(holiday_date, 'Mon-YYYY')) = upper(p_appointment_month)
                                            )
                                    )
                            )
                        where
                            seq_num in ( 1, 4, 10, 12, 18,
                                         20, 22, 24 )
                    ) loop
                        select
                            count(*)
                        into lv_appt_count
                        from
                            xxeba_sales_crm_appointments
                        where
                                to_date(trunc(appointment_date),
                                        'DD-Mon-YYYY') = to_date(r_workday.day, 'DD-Mon-YYYY')
                            and salesrep_id = r_cust.default_rep_id;

                        if lv_appt_count < r_cust.meetings_per_day then
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
                            ) values ( r_cust.id,
                                       'Planning',
                                       r_workday.day,
                                       'Direct Visit',
                                       'Scheduled from Account''s Visit Frequency',
                                       'Scheduled',
                                       null,
                                       r_cust.default_rep_id,
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

                            commit;
                        end if;

                    end loop;

                end if;
            end loop;
        end loop;
    end wekkly_twice_visit;

    procedure visit_time (
        p_appointment_month varchar2
    ) is

        lv_count number;
        cursor reps is
        select
            *
        from
            eba_sales_salesreps
        where
            status = 'Y';

        cursor appt (
            lv_rep_id number,
            lv_date   date
        ) is
        select
            *
        from
            xxeba_sales_crm_appointments
        where
                salesrep_id = lv_rep_id
            and to_char(
                trunc(appointment_date),
                'DD-MON_YY'
            ) = to_char(lv_date, 'DD-MON_YY');

        cursor work_days is
        select
            *
        from
            (
                select
                    day,
                    rownum as seq_num
                from
                    (
                        select
                            trunc(sysdate, 'MM') + level - 1 as day
                        from
                            dual
                        where
                                ( trunc(sysdate, 'MM') + level - 1 ) >= trunc(sysdate)
                            and upper(to_char(sysdate, 'Mon-YYYY')) = upper(p_appointment_month)
                        connect by
                            trunc(trunc(sysdate, 'MM') + level - 1,
                                  'MM') = trunc(sysdate, 'MM')
                        minus
                        select
                            dy as day
                        from
                            (
                                select
                                    *
                                from
                                    (
                                        select
                                            trunc(to_date('01-'
                                                          || p_appointment_month, 'DD-MON-YYYY'), 'mm') + level - 1 dy
                                        from
                                            dual
                                        connect by
                                            level < ( trunc(
                                                add_months(to_date('01-'
                                                                   || p_appointment_month, 'DD-MON-YYYY'), 1),
                                                'mm'
                                            ) - trunc(to_date('01-'
                                                              || p_appointment_month, 'DD-MON-YYYY'), 'mm') ) + 1
                                    )
                                where
                                    to_char(dy, 'd') = 1
                                union all
                                select
                                    holiday_date
                                from
                                    xxeba_sales_holidays_t
                                where
                                        status = 'Y'
                                    and upper(to_char(holiday_date, 'Mon-YYYY')) = upper(p_appointment_month)
                            )
                    )
            );

    begin
        for r_reps in reps loop
            for r_day in work_days loop
                lv_count := 9;
                for r_appt in appt(r_reps.id, r_day.day) loop
                    update xxeba_sales_crm_appointments
                    set
                        appointment_date = appointment_date + numtodsinterval(lv_count, 'hour')
                    where
                        appt_id = r_appt.appt_id;

                    lv_count := lv_count + 1;
                    commit;
                end loop;

            end loop;
        end loop;
    end visit_time;

end xxeba_sales_engineer_visit_pkg;
/


-- sqlcl_snapshot {"hash":"cb13c2d061c5a9e80dc19beaae8fe1f8a48d19ca","type":"PACKAGE_BODY","name":"XXEBA_SALES_ENGINEER_VISIT_PKG","schemaName":"XXVENTURI","sxml":""}