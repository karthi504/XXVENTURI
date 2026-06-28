create or replace package body xxventuri.xxeba_sales_engineer_effi_pkg as

    function xxeba_sales_find_new_customer (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number as
        lv_new_acc        number;
        lv_rep_name       varchar2(100);
        lv_identify_score number;
        lv_first_order    number;
        lv_repeat_order   number;
    begin   
 
/***************** Customer Idetification Stage**********************************/
        select
            rep_first_name
        into lv_rep_name
        from
            eba_sales_salesreps
        where
            id = p_user_id;

        select
            count(*)
        into lv_new_acc
        from
            eba_sales_customers
        where
                default_rep_id = p_user_id--created_by = upper(lv_rep_name) 
            and status = 'A'
            and trunc(created) between p_from_date and p_to_date;

        select
            count(*)
        into lv_first_order
        from
            xxeba_sales_order
        where
            customer_id in (
                select
                    id
                from
                    eba_sales_customers
                where
                        default_rep_id = p_user_id --created_by = upper(lv_rep_name) 
                    and status = 'A'
                    and trunc(created) between p_from_date and p_to_date
            )
            and status = 'Y';

        select
            count(*)
        into lv_repeat_order
        from
            xxeba_sales_order
        where
            customer_id in (
                select
                    id
                from
                    eba_sales_customers
                where
                        default_rep_id = p_user_id --created_by = upper(lv_rep_name) 
                    and status = 'A'
                    and trunc(created) between p_from_date and p_to_date
            )
            and order_repeat = 'Y'
            and status = 'Y';

        if
            p_type = 'Identification'
            and lv_new_acc > 0
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Finding New Customer'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = 'First Order'
            and lv_first_order > 0
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Finding New Customer'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = 'Repeat Order'
            and lv_repeat_order > 0
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Finding New Customer'
                and component_name = p_type;

            return lv_identify_score;
        else
            return 0;
        end if;

    exception
        when others then 
     -- xxfs_pm_error_log_pkg.record_log('ERROR',' Customer Idetification',NULL,1); 
            return 0; 
        /*when NO_DATA_FOUND then 
        return 0;*/
    end xxeba_sales_find_new_customer;

    function xxeba_sales_customer_visit (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number as
        lv_identify_score   number;
        lv_appt_plan_count  number;
        lv_appt_visit_count number;
        lv_appt_visit_pct   number;
    begin   
/***************** Customer Visit**********************************/
        select
            count(*)
        into lv_appt_plan_count
        from
            xxeba_sales_crm_appointments
        where
                salesrep_id = p_user_id
            and trunc(appointment_date) between p_from_date and p_to_date
            and appointment_status <> 'Cancelled';

        select
            count(*)
        into lv_appt_visit_count
        from
            xxeba_sales_crm_appointments
        where
                salesrep_id = p_user_id
            and trunc(appointment_date) between p_from_date and p_to_date
            and appointment_status = 'Visited';

        if
            lv_appt_plan_count > 0
            and lv_appt_visit_count > 0
        then
            lv_appt_visit_pct := ( lv_appt_visit_count / lv_appt_plan_count ) * 100; 
--RETURN lv_appt_visit_pct; 
 
--DBMS_OUTPUT.PUT_LINE('Appt Pct'||lv_appt_visit_pct||' appt Visit Count: ' 
--||lv_appt_visit_count||' appt Plan Count: '||lv_appt_plan_count); 
            if
                p_type = '100% Plan'
                and ( lv_appt_visit_pct between 91 and 100 )
            then
                select
                    component_score
                into lv_identify_score
                from
                    xxeba_sales_effi_details_t ed,
                    xxeba_sales_efficiency_t   e
                where
                        ed.efficiency_id = e.efficiency_id
                    and item_name = 'Customer Visit'
                    and component_name = p_type;

                return lv_identify_score;
            elsif
                p_type = '90% Plan'
                and ( lv_appt_visit_pct between 76 and 90 )
            then
                select
                    component_score
                into lv_identify_score
                from
                    xxeba_sales_effi_details_t ed,
                    xxeba_sales_efficiency_t   e
                where
                        ed.efficiency_id = e.efficiency_id
                    and item_name = 'Customer Visit'
                    and component_name = p_type;

                return lv_identify_score;
            elsif
                p_type = '75% Plan'
                and ( lv_appt_visit_pct between 51 and 75 )
            then
                select
                    component_score
                into lv_identify_score
                from
                    xxeba_sales_effi_details_t ed,
                    xxeba_sales_efficiency_t   e
                where
                        ed.efficiency_id = e.efficiency_id
                    and item_name = 'Customer Visit'
                    and component_name = p_type;

                return lv_identify_score;
            elsif
                p_type = '<50%'
                and lv_appt_visit_pct <= 50
            then
                select
                    component_score
                into lv_identify_score
                from
                    xxeba_sales_effi_details_t ed,
                    xxeba_sales_efficiency_t   e
                where
                        ed.efficiency_id = e.efficiency_id
                    and item_name = 'Customer Visit'
                    and component_name = p_type;

                return lv_identify_score;
            else
                return 0;
            end if;

        else
            return 0;
        end if;

    exception
        when others then 
     -- xxfs_pm_error_log_pkg.record_log('ERROR',' Customer Idetification',NULL,1); 
            return 0; 
         /*when NO_DATA_FOUND then 
        return 0;*/
    end xxeba_sales_customer_visit;

    function xxeba_sales_conducting_trials (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number as

        lv_tooling_up        number;
        lv_rep_name          varchar2(100);
        lv_identify_score    number;
        lv_new_trial         number;
        lv_exisiting_trial   number;
        lv_replacement_trial number;
    begin   
 
/***************** Conductiong Trials**********************************/
        select
            rep_first_name
        into lv_rep_name
        from
            eba_sales_salesreps
        where
            id = p_user_id;

        select
            count(*)
        into lv_new_trial
        from
            xxeba_trial_details tri,
            eba_sales_deals     dea
        where
                tri.deal_id = dea.id
            and dea.salesrep_id_01 = p_user_id -- tri.created_by = upper(lv_rep_name) 
            and tri.status = 'C'
            and tri.new_trial_or_existing = 'N'
            and trunc(tri.updated_date) between p_from_date and p_to_date;

        select
            count(*)
        into lv_exisiting_trial
        from
            xxeba_trial_details tri,
            eba_sales_deals     dea
        where
                tri.deal_id = dea.id
            and dea.salesrep_id_01 = p_user_id
            and tri.status = 'C'
            and tri.new_trial_or_existing = 'E' 
            --AND created_by = upper(lv_rep_name) 
            and trunc(tri.updated_date) between p_from_date and p_to_date;

        select
            count(*)
        into lv_replacement_trial
        from
            xxeba_trial_details tri,
            eba_sales_deals     dea
        where
                tri.deal_id = dea.id
            and dea.salesrep_id_01 = p_user_id
            and tri.status = 'C'
            and tri.new_trial_or_existing = 'C' 
           -- AND created_by = upper(lv_rep_name) 
            and trunc(tri.updated_date) between p_from_date and p_to_date;

        if
            p_type = 'New Product'
            and lv_new_trial > 0
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Conducting Trials'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = 'Improvement'
            and lv_exisiting_trial > 0
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Conducting Trials'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = 'Competition Replacement'
            and lv_replacement_trial > 0
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Conducting Trials'
                and component_name = p_type;

            return lv_identify_score;
        else
            return 0;
        end if;

    exception
        when others then 
     -- xxfs_pm_error_log_pkg.record_log('ERROR',' Customer Idetification',NULL,1); 
            return 0; 
       /*when NO_DATA_FOUND then 
        return 0;*/
    end xxeba_sales_conducting_trials;

    function xxeba_sales_quote_submission (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number as
        lv_tooling_up     number;
        lv_rep_name       varchar2(100);
        lv_identify_score number;
        lv_project        number;
    begin   
 
/***************** Customer Quatation Sent**********************************/
        select
            rep_first_name
        into lv_rep_name
        from
            eba_sales_salesreps
        where
            id = p_user_id;

        select
            count(*)
        into lv_tooling_up
        from
            eba_sales_deals   d,
            xxeba_list_values l
        where
                d.quote_type_id = l.list_id
            and d.quote_type_id is not null
            and l.list_value = 'Tooling Up'
            and salesrep_id_01 = p_user_id -- d.created_by = upper(lv_rep_name) 
            and trunc(d.updated) between p_from_date and p_to_date;

        select
            count(*)
        into lv_project
        from
            eba_sales_deals   d,
            xxeba_list_values l
        where
                d.quote_type_id = l.list_id
            and d.quote_type_id is not null
            and l.list_value = 'Project'
            and salesrep_id_01 = p_user_id  --AND d.created_by = upper(lv_rep_name) 
            and trunc(d.updated) between p_from_date and p_to_date;

        if
            p_type = 'Tooling Up'
            and lv_tooling_up > 0
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Quotation Submission'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = 'Project'
            and lv_project > 0
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Quotation Submission'
                and component_name = p_type;

            return lv_identify_score;
        else
            return 0;
        end if;

    exception
        when others then 
     -- xxfs_pm_error_log_pkg.record_log('ERROR',' Customer Idetification',NULL,1); 
            return 0; 
       /*when NO_DATA_FOUND then 
        return 0;*/
    end xxeba_sales_quote_submission;

    function xxeba_sales_negotiation (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number as
        lv_identify_score    number;
        lv_new_product_count number;
        lv_project_count     number;
        lv_price_count       number;
    begin   
/***************** Customer Visit**********************************/
        select
            count(*)
        into lv_new_product_count
        from
            xxeba_sales_crm_appointments,
            xxeba_list_values l
        where
                negotiation_id = l.list_id
            and salesrep_id = p_user_id
            and trunc(appointment_date) between p_from_date and p_to_date
            and l.list_value = 'New Product'
            and appointment_status = 'Visited'
            and negotiation_id is not null;

        select
            count(*)
        into lv_project_count
        from
            xxeba_sales_crm_appointments,
            xxeba_list_values l
        where
                negotiation_id = l.list_id
            and salesrep_id = p_user_id
            and trunc(appointment_date) between p_from_date and p_to_date
            and l.list_value = 'Project'
            and appointment_status = 'Visited'
            and negotiation_id is not null;

        select
            count(*)
        into lv_price_count
        from
            xxeba_sales_crm_appointments,
            xxeba_list_values l
        where
                negotiation_id = l.list_id
            and salesrep_id = p_user_id
            and trunc(appointment_date) between p_from_date and p_to_date
            and l.list_value = 'Price Increase'
            and appointment_status = 'Visited'
            and negotiation_id is not null;

        if
            p_type = 'New Product'
            and lv_new_product_count > 0
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Negotiation'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = 'Project'
            and lv_project_count > 0
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Negotiation'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = 'Price Increase'
            and lv_price_count > 0
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Negotiation'
                and component_name = p_type;

            return lv_identify_score;
        else
            return 0;
        end if;

    exception
        when others then 
     -- xxfs_pm_error_log_pkg.record_log('ERROR',' Customer Idetification',NULL,1); 
            return 0; 
      /*when NO_DATA_FOUND then 
        return 0;*/
    end xxeba_sales_negotiation;

    function xxeba_sales_po_collection (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number as

        lv_identify_score     number;
        lv_first_order        number;
        lv_annual_order       number;
        lv_schedule_order     number;
        lv_rep_name           varchar2(200);
        lv_total_customer     number;
        lv_schedule_order_pct number;
        lv_annual_order_pct   number;
        lv_first_order_pct    number;
    begin   
/***************** PO Collection**********************************/
        select
            rep_first_name
        into lv_rep_name
        from
            eba_sales_salesreps
        where
            id = p_user_id;

        select
            count(id)
        into lv_total_customer
        from
            eba_sales_customers
        where
                status != 'X'
            and default_rep_id = p_user_id;

        select
            count(order_id)
        into lv_first_order
        from
            xxeba_sales_order s,
            xxeba_list_values l
        where
                s.order_type_id = l.list_id
            and s.sales_rep = p_user_id--s.created_by = upper(lv_rep_name) 
            and trunc(s.created) between p_from_date and p_to_date
            and l.list_value = 'First Order'
            and s.status = 'Y'
            and s.order_type_id is not null;

        select
            count(order_id)
        into lv_annual_order
        from
            xxeba_sales_order s,
            xxeba_list_values l
        where
                s.order_type_id = l.list_id
            and s.sales_rep = p_user_id--AND s.created_by = upper(lv_rep_name) 
            and trunc(s.created) between p_from_date and p_to_date
            and l.list_value = 'Annual Order'
            and s.status = 'Y'
            and s.order_type_id is not null;

        select
            count(order_id)
        into lv_schedule_order
        from
            xxeba_sales_order s,
            xxeba_list_values l
        where
                s.order_type_id = l.list_id
            and s.sales_rep = p_user_id--AND s.created_by = upper(lv_rep_name) 
            and trunc(s.created) between p_from_date and p_to_date
            and l.list_value = 'Schedule Order'
            and s.status = 'Y'
            and s.order_type_id is not null;

        if
            lv_total_customer > 0
            and lv_schedule_order > 0
        then
            lv_schedule_order_pct := ( lv_schedule_order / lv_total_customer ) * 100;
        end if;

        if
            lv_total_customer > 0
            and lv_annual_order > 0
        then
            lv_annual_order_pct := ( lv_annual_order / lv_total_customer ) * 100;
        end if;

        if
            lv_total_customer > 0
            and lv_first_order > 0
        then
            lv_first_order_pct := ( lv_first_order / lv_total_customer ) * 100;
        end if; 
 
/*IF P_TYPE='First Order' and  lv_first_order >  0 then 
select COMPONENT_SCORE into lv_identify_score from XXEBA_SALES_EFFI_DETAILS_T ED,XXEBA_SALES_EFFICIENCY_T E  
where ED.EFFICIENCY_ID=E.EFFICIENCY_ID and ITEM_NAME='Purchase Order Collection' and COMPONENT_NAME=P_TYPE; 
RETURN lv_identify_score; 
 
elsif P_TYPE='Annual Order' and  lv_annual_order > 0 then 
select COMPONENT_SCORE into lv_identify_score from XXEBA_SALES_EFFI_DETAILS_T ED,XXEBA_SALES_EFFICIENCY_T E  
where ED.EFFICIENCY_ID=E.EFFICIENCY_ID and ITEM_NAME='Purchase Order Collection' and COMPONENT_NAME=P_TYPE; 
RETURN lv_identify_score; 
 
elsif P_TYPE='Schedule Order' and lv_schedule_order > 0 then 
select COMPONENT_SCORE into lv_identify_score from XXEBA_SALES_EFFI_DETAILS_T ED,XXEBA_SALES_EFFICIENCY_T E  
where ED.EFFICIENCY_ID=E.EFFICIENCY_ID and ITEM_NAME='Purchase Order Collection' and COMPONENT_NAME=P_TYPE; 
RETURN lv_identify_score;*/

        if
            p_type = 'First Order'
            and lv_first_order_pct > 50
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Purchase Order Collection'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = 'First Order'
            and lv_first_order_pct between 1 and 50
        then
            select
                ( component_score / 2 )
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Purchase Order Collection'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = 'Annual Order'
            and lv_annual_order_pct > 50
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Purchase Order Collection'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = 'Annual Order'
            and lv_annual_order_pct between 1 and 50
        then
            select
                ( component_score / 2 )
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Purchase Order Collection'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = 'Schedule Order'
            and lv_schedule_order_pct > 50
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Purchase Order Collection'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = 'Schedule Order'
            and lv_schedule_order_pct between 1 and 50
        then
            select
                ( component_score / 2 )
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Purchase Order Collection'
                and component_name = p_type;

            return lv_identify_score;
        else
            return 0;
        end if;

    exception
        when others then 
     -- xxfs_pm_error_log_pkg.record_log('ERROR',' Customer Idetification',NULL,1); 
            return 0; 
       /*when NO_DATA_FOUND then 
        return 0;*/
    end xxeba_sales_po_collection;

    function xxeba_sales_so (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number as
        lv_identify_score number;
        lv_order_value    number;
        lv_repeat_count   number;
        lv_rep_name       varchar2(200);
    begin   
/***************** SO Profit**********************************/
        select
            rep_first_name
        into lv_rep_name
        from
            eba_sales_salesreps
        where
            id = p_user_id;

        select
            sum(order_value)
        into lv_order_value
        from
            (
                select
                    ( quantity * product_price ) order_value
                from
                    xxeba_sales_order    so,
                    xxeba_order_products op
                where
                        so.order_id = op.order_id
                    and trunc(so.created) between p_from_date and p_to_date
                    and so.status not in ( 'X', 'R' )
                    and so.order_repeat = 'N'
                    and so.sales_rep = p_user_id-- so.created_by = upper(lv_rep_name) 
            );

        select
            count(*)
        into lv_repeat_count
        from
            xxeba_sales_order
        where
            trunc(created) between p_from_date and p_to_date
            and status not in ( 'X', 'R' )
            and order_repeat = 'Y'
            and sales_rep = p_user_id;-- created_by = upper(lv_rep_name); 
        if
            p_type = '>50000'
            and lv_order_value between 50000 and 100000
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Sales Order'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = '>100000'
            and lv_order_value > 100000
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Sales Order'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = 'Repeat Sales Order'
            and lv_repeat_count >= 1
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Sales Order'
                and component_name = p_type;

            return lv_identify_score;
        else
            return 0;
        end if;

    exception
        when others then 
     -- xxfs_pm_error_log_pkg.record_log('ERROR',' Customer Idetification',NULL,1); 
            return 0; 
       /*when NO_DATA_FOUND then 
        return 0;*/
    end xxeba_sales_so;

    function xxeba_sales_material_planning (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number as
        lv_identify_score number;
        lv_planning_count number;
        lv_rep_name       varchar2(200);
    begin   
/***************** SO Profit**********************************/
        select
            rep_first_name
        into lv_rep_name
        from
            eba_sales_salesreps
        where
            id = p_user_id;

        select
            sum(planning_count)
        into lv_planning_count
        from
            (
                select
                    trunc(op.delivery_date) - trunc(sysdate) as planning_count
                from
                    xxeba_sales_order    so,
                    xxeba_order_products op
                where
                        so.order_id = op.order_id
                    and trunc(so.created) between p_from_date and p_to_date
                    and so.status not in ( 'X', 'R' )
                    and trunc(op.delivery_date) >= trunc(sysdate)
                    and so.sales_rep = p_user_id--so.created_by = upper(lv_rep_name) 
            );

        if
            p_type = 'Monthly'
            and lv_planning_count between 1 and 30
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Material Planning'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = '3 Months'
            and lv_planning_count between 31 and 90
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Material Planning'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = '6 Months'
            and lv_planning_count between 91 and 180
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Material Planning'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = 'Annual'
            and lv_planning_count > 180
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Material Planning'
                and component_name = p_type;

            return lv_identify_score;
        else
            return 0;
        end if;

    exception
        when others then 
     -- xxfs_pm_error_log_pkg.record_log('ERROR',' Customer Idetification',NULL,1); 
            return 0; 
       /*when NO_DATA_FOUND then 
        return 0;*/
    end xxeba_sales_material_planning;

    function xxeba_sales_material_supply (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number as
        lv_identify_score   number;
        lv_supply_count     number;
        lv_rep_name         varchar2(200);
        lv_total_customer   number;
        lv_supply_count_pct number;
    begin   
/***************** SO Profit**********************************/
        select
            rep_first_name
        into lv_rep_name
        from
            eba_sales_salesreps
        where
            id = p_user_id;

        select
            count(id)
        into lv_total_customer
        from
            eba_sales_customers
        where
                status != 'X'
            and default_rep_id = p_user_id;

        select
            sum(supply_count)
        into lv_supply_count
        from
            (
                select
                    ( to_date(substr(updated_temp, 1, 9),
        'DD-Mon-YY') - order_date ) as supply_count
                from
                    xxeba_sales_order so
                where
                    ( so.order_date ) between p_from_date and p_to_date
                    and so.status not in ( 'X', 'R' )
                    and so.updated_in_tally = 'Y'
                    and so.sales_rep = p_user_id--so.created_by = upper(lv_rep_name) 
            );

        if
            lv_total_customer > 0
            and lv_supply_count > 0
        then
            lv_supply_count_pct := ( lv_supply_count / lv_total_customer ) * 100;
        end if; 
  
/*IF P_TYPE='On Time' and  lv_supply_count=0  then 
select COMPONENT_SCORE into lv_identify_score from XXEBA_SALES_EFFI_DETAILS_T ED,XXEBA_SALES_EFFICIENCY_T E  
where ED.EFFICIENCY_ID=E.EFFICIENCY_ID and ITEM_NAME='Material Supply' and COMPONENT_NAME=P_TYPE; 
RETURN lv_identify_score; 
 
elsif P_TYPE='Delayed' and  lv_supply_count between  1 and 7 then 
select COMPONENT_SCORE into lv_identify_score from XXEBA_SALES_EFFI_DETAILS_T ED,XXEBA_SALES_EFFICIENCY_T E  
where ED.EFFICIENCY_ID=E.EFFICIENCY_ID and ITEM_NAME='Material Supply' and COMPONENT_NAME=P_TYPE; 
RETURN lv_identify_score; 
 
elsif P_TYPE='Delay More Than Week' and  lv_supply_count > 7 then 
select COMPONENT_SCORE into lv_identify_score from XXEBA_SALES_EFFI_DETAILS_T ED,XXEBA_SALES_EFFICIENCY_T E  
where ED.EFFICIENCY_ID=E.EFFICIENCY_ID and ITEM_NAME='Material Supply' and COMPONENT_NAME=P_TYPE; 
RETURN lv_identify_score; 
else 
return 0; 
end if;*/

        if
            p_type = 'On Time'
            and lv_supply_count_pct = 0
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Material Supply'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = 'Delayed'
            and lv_supply_count_pct between 1 and 7
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Material Supply'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = 'Delay More Than Week'
            and lv_supply_count_pct > 7
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Material Supply'
                and component_name = p_type;

            return lv_identify_score;
        else
            return 0;
        end if;

    exception
        when others then 
     -- xxfs_pm_error_log_pkg.record_log('ERROR',' Customer Idetification',NULL,1); 
            return 0; 
       /*when NO_DATA_FOUND then 
        return 0;*/
    end xxeba_sales_material_supply;

    function xxeba_sales_margin (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number as
        lv_identify_score number;
        lv_margin_pct     number;
        lv_rep_name       varchar2(200);
        lv_margin         number;
        lv_total_customer number;
    begin   
/***************** SO Profit**********************************/
        select
            rep_first_name
        into lv_rep_name
        from
            eba_sales_salesreps
        where
            id = p_user_id;

        select
            count(id)
        into lv_total_customer
        from
            eba_sales_customers
        where
                status != 'X'
            and default_rep_id = p_user_id;

        select
            sum(round((((op.product_price / sp.product_cost) * 100) - 100), 2))
        into lv_margin
        from
            xxeba_sales_order    so,
            xxeba_order_products op,
            eba_sales_products   sp
        where
                so.order_id = op.order_id
            and op.product_id = sp.id
            and trunc(so.created) between p_from_date and p_to_date
            and so.sales_rep = p_user_id--so.created_by = upper(lv_rep_name) 
            and so.status not in ( 'X', 'R' );

        if
            lv_margin > 0
            and lv_total_customer > 0
        then
            lv_margin_pct := ( lv_margin / lv_total_customer ) * 100;
        end if;

        if
            p_type = '<20%'
            and lv_margin_pct <= 20
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Margin'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = '>20%'
            and lv_margin_pct between 21 and 30
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Margin'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = '>30%'
            and lv_margin_pct between 31 and 50
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Margin'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = '>50%'
            and lv_margin_pct between 51 and 100
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Margin'
                and component_name = p_type;

            return lv_identify_score;
        else
            return 0;
        end if;

    exception
        when others then 
     -- xxfs_pm_error_log_pkg.record_log('ERROR',' Customer Idetification',NULL,1); 
            return 0; 
       /*when NO_DATA_FOUND then 
        return 0;*/
    end xxeba_sales_margin;

    function xxeba_sales_discipline (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number as

        lv_identify_score     number;
        lv_margin_pct         number;
        lv_rep_name           varchar2(200);
        v_count               number;
        lv_count              number;
        lv_count2             number;
        lv_leave_count        number := 0;
        lv_late_count         number;
        lv_permission_count   number;
        lv_late_arrival_count number;
        cursor c1 is
        select
            to_date(p_from_date, 'DD-Mon-YYYY') + rownum - 1 as leave_date
        from
            dual
        connect by
            level <= to_date(p_to_date, 'DD-Mon-YYYY') - to_date(p_from_date, 'DD-Mon-YYYY') + 1;

    begin   
/***************** Discipline**********************************/
        select
            rep_first_name
        into lv_rep_name
        from
            eba_sales_salesreps
        where
            id = p_user_id;

        select
            count(*)
        into lv_permission_count
        from
            xxeba_sales_permissions_t
        where
                sales_rep_id = p_user_id
            and permission_status in ( 'A', 'S' )
            and trunc(permission_date) between p_from_date and p_to_date;

        select
            count(att_id)
        into lv_late_count
        from
            xxeba_sales_attendance_t
        where
                employee_id = p_user_id
            and trunc(attend_date) between p_from_date and p_to_date
            and to_char(attend_intime, 'HH24:MI') > '09:15';

        if
            p_to_date is not null
            and p_from_date is not null
        then
            select
                ( to_date(p_to_date) - to_date(p_from_date) ) + 1
            into v_count
            from
                dual;

            if v_count >= 1 then
                for i in c1 loop
                    select
                        count(*)
                    into lv_count
                    from
                        xxeba_sales_leave_requests_t
                    where
                            sales_rep_id = p_user_id
                        and to_date(i.leave_date, 'DD-Mon-YYYY') between to_date(from_date, 'DD-Mon-YYYY') and to_date(to_date, 'DD-Mon-YYYY'
                        )
                        and leave_status in ( 'S', 'A' );

                    if lv_count > 0 then
                        lv_leave_count := lv_leave_count + lv_count;
                    end if;
                end loop;

                dbms_output.put_line(lv_leave_count);
            end if;

        end if;

        if
            lv_late_count > 0
            and lv_permission_count > 0
        then
            lv_late_arrival_count := lv_late_count - lv_permission_count;
        else
            lv_late_arrival_count := lv_late_count;
        end if;

        if
            p_type = 'No Leave'
            and lv_leave_count = 0
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Discipline'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = '2 Days'
            and lv_leave_count = 2
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Discipline'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = '>2 Days'
            and lv_leave_count > 2
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Discipline'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = 'Late Arrival'
            and lv_late_arrival_count > 3
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Discipline'
                and component_name = p_type;

            return lv_identify_score;
        else
            return 0;
        end if;

    exception
        when others then 
     -- xxfs_pm_error_log_pkg.record_log('ERROR',' Customer Idetification',NULL,1); 
            return 0; 
       /*when NO_DATA_FOUND then 
        return 0;*/
    end xxeba_sales_discipline;

    function xxeba_sales_report_submit (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number as

        lv_identify_score number;
        lv_rep_name       varchar2(200);
        lv_effi_type      varchar2(200);
        cursor c1 is
        select
            to_date(p_from_date, 'DD-Mon-YYYY') + rownum - 1 as leave_date
        from
            dual
        connect by
            level <= to_date(p_to_date, 'DD-Mon-YYYY') - to_date(p_from_date, 'DD-Mon-YYYY') + 1;

    begin  
/***************** Report Submission**********************************/
        select
            rep_first_name
        into lv_rep_name
        from
            eba_sales_salesreps
        where
            id = p_user_id;

        select
            efficiency_type
        into lv_effi_type
        from
            xxeba_efficiency_data_t
        where
                sales_rep_id = p_user_id
            and trunc(perf_from_date) between p_from_date and p_to_date
            and efficiency_type = p_type;

        if
            p_type = 'On-Time'
            and lv_effi_type = 'On-Time'
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Report Submission'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = 'Delayed'
            and lv_effi_type = 'Delayed'
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Report Submission'
                and component_name = p_type;

            return lv_identify_score;
        else
            return 0;
        end if;

    exception
        when others then
     -- xxfs_pm_error_log_pkg.record_log('ERROR',' Customer Idetification',NULL,1);
            return 0;
       /*when NO_DATA_FOUND then
        return 0;*/
    end xxeba_sales_report_submit;

    function xxeba_sales_rewards (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number as

        lv_identify_score number;
        lv_rep_name       varchar2(200);
        lv_rewards_score  number;
        cursor c1 is
        select
            to_date(p_from_date, 'DD-Mon-YYYY') + rownum - 1 as leave_date
        from
            dual
        connect by
            level <= to_date(p_to_date, 'DD-Mon-YYYY') - to_date(p_from_date, 'DD-Mon-YYYY') + 1;

    begin  
/***************** Rewards**********************************/
        select
            rep_first_name
        into lv_rep_name
        from
            eba_sales_salesreps
        where
            id = p_user_id;

        select
            sum(perf_rewards)
        into lv_rewards_score
        from
            xxeba_efficiency_data_t
        where
                sales_rep_id = p_user_id
            and trunc(perf_from_date) between p_from_date and p_to_date;

        lv_identify_score := lv_rewards_score;
        if lv_identify_score > 0 then
            return lv_identify_score;
        else
            return 0;
        end if;
    exception
        when others then
     -- xxfs_pm_error_log_pkg.record_log('ERROR',' Customer Idetification',NULL,1);
            return 0;
       /*when NO_DATA_FOUND then
        return 0;*/
    end xxeba_sales_rewards;

    function xxeba_sales_payment_collection (
        p_user_id   number,
        p_type      varchar2,
        p_from_date date,
        p_to_date   date
    ) return number as

        lv_identify_score number;
        lv_margin_pct     number;
        lv_rep_name       varchar2(200);
        lv_payment_days   number;
        lv_total_customer number;
        lv_credit_days    number;
        lv_billing_days   number;
    begin  
/***************** Payment Collection**********************************/
        select
            rep_first_name
        into lv_rep_name
        from
            eba_sales_salesreps
        where
            id = p_user_id;

       /* SELECT 
			   trunc((select max(invoice_date) from XXEBA_TALLY_INVOICES_T where SALES_ORDER_NUMBER=ORDER_NUMBER))- trunc(ORDER_DATE) into lv_payment_days
           FROM
            xxeba_sales_order 
        WHERE UPDATED_IN_TALLY='Y'
		    AND  trunc(created) BETWEEN p_from_date AND p_to_date
            AND SALES_REP = p_user_id
            AND status NOT IN ('X','R');*/
        select
            ( ( cd.credit_terms_rec ) - ( trunc(last_receipt_date) - trunc(invoice_date) ) )
        into lv_payment_days
        from
            xxeba_tally_invoices_t       inv,
            eba_sales_customers          c,
            xxeba_sales_customer_details cd
        where
                c.row_key = inv.customer_id
            and c.id = cd.customer_id
            and inv.last_receipt_date is not null
            and batch_sequence = (
                select
                    max(batch_sequence)
                from
                    xxeba_tally_invoices_t
                where
                    invoice_number = inv.invoice_number
            )
            and to_date(to_char(last_receipt_date, 'DD-Mon-YYYY'),
        'DD-MM-YYYY') between p_from_date and p_to_date
            and c.default_rep_id = p_user_id;


       /* on time */
        if
            p_type = 'On Time'
            and lv_payment_days between 0 and 75
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Payment Collection'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = '>75 days'
            and lv_payment_days between 76 and 90
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Payment Collection'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = '>90 days'
            and lv_payment_days between 91 and 120
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Payment Collection'
                and component_name = p_type;

            return lv_identify_score;
        elsif
            p_type = '>120 days'
            and lv_payment_days > 121
        then
            select
                component_score
            into lv_identify_score
            from
                xxeba_sales_effi_details_t ed,
                xxeba_sales_efficiency_t   e
            where
                    ed.efficiency_id = e.efficiency_id
                and item_name = 'Payment Collection'
                and component_name = p_type;

            return lv_identify_score;
        else
            return 0;
        end if;

    exception
        when others then
     -- xxfs_pm_error_log_pkg.record_log('ERROR',' Customer Idetification',NULL,1);
            return 0;
       /*when NO_DATA_FOUND then
        return 0;*/
    end xxeba_sales_payment_collection;

end xxeba_sales_engineer_effi_pkg;
/


-- sqlcl_snapshot {"hash":"3364eefbf22dd41f35b88e26c15ef62bb1e9dccd","type":"PACKAGE_BODY","name":"XXEBA_SALES_ENGINEER_EFFI_PKG","schemaName":"XXVENTURI","sxml":""}