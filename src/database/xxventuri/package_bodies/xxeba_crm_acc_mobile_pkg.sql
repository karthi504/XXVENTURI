create or replace package body xxventuri.xxeba_crm_acc_mobile_pkg as 
 
 
  /************************************************************************************************************************************************************ 
      Name            :    XXEBA_CRM_ACC_MOBILE_PKG 
      Purpose         :    For maintaining the complete (Msk VenturiTools)CRM modules in mobile apps.
      Version History :     1.2 (Push Notification)

      Ver No.  Date	       Author	     Description of changes
      ------ --------     --------	    ---------------------------------------------------
      1.0	12-Sep-2017  Sowndaryameena  This package is exclusively for maintaining  timesheet(Approve,Reject) - Initial Version 
      1.1   20-Aug-2019  Sowndaryameena  Included changes for adding Leave Approval and Permission Approval.--Moved to Production on 1st October 2019 by sowndaryameena
      1.2   12-Dec-2019  Sowndaryameena  Added new procedure named insert_device_list for storing the device information with FCM Registered token --Added by Sowndaryameena                                 
   ************************************************************************************************************************************************************/

    procedure add_account (
        customer_name              varchar2,
        customer_code              varchar2,
        customer_is_key_account_yn varchar2,
        customer_territory_id      varchar2,
        account_source             varchar2,
        industry_id                number,
        gst_no                     varchar2,
        classification_id          number,
        pan_number                 varchar2,
        email_address              varchar2,
        phone_number               number,
        mobile_number              number,
        default_rep_id             varchar2,
        customer_description       varchar2,
        customer_web_site          varchar2,
        tags                       varchar2,
        created_by                 varchar2,
        updated_by                 varchar2
    ) as
	-- l_cursor SYS_REFCURSOR;
        p_success_flag varchar2(240);
        l_ret          rowid;
    begin
        insert into eba_sales_customers (
            customer_name,
            customer_code,
            customer_is_key_account_yn,
            customer_territory_id,
            account_source,
            industry_id,
            gst_no,
            classification_id,
            pan_number,
            email_address,
            phone_number,
            mobile_number,
            default_rep_id,
            customer_description,
            customer_web_site,
            tags,
            created_by,
            updated_by
        ) values ( customer_name,
                   customer_code,
                   customer_is_key_account_yn,
                   to_number(customer_territory_id),
                   account_source,
                   industry_id,
                   gst_no,
                   classification_id,
                   pan_number,
                   email_address,
                   phone_number,
                   mobile_number,
                   to_number(default_rep_id),
                   customer_description,
                   customer_web_site,
                   tags,
                   created_by,
                   updated_by ) returning rowid into l_ret;

        if l_ret is null then
            dbms_output.put_line('L_ret is null');
            p_success_flag := 'Failed';
        else
            dbms_output.put_line('L_ret else');
            p_success_flag := 'Success';
        end if;

        apex_json.open_object;
        apex_json.write('add_account', p_success_flag);
        apex_json.close_object;
    end add_account;

	--------Edit  Account----

    procedure edit_account (
        p_acc_id                     varchar2,
        p_customer_name              varchar2,
        p_customer_code              varchar2,
        p_customer_is_key_account_yn varchar2,
        p_customer_territory_id      number,
        p_account_source             varchar2,
        p_industry_id                varchar2,
        p_gst_no                     varchar2,
        p_classification_id          number,
        p_pan_number                 varchar2,
        p_email_address              varchar2,
        p_phone_number               varchar2,
        p_mobile_number              varchar2,
        p_default_rep_id             number,
        p_customer_description       varchar2,
        p_customer_web_site          varchar2,
        p_tags                       varchar2,
        p_created_by                 varchar2,
        p_updated_by                 varchar2
    ) as
        l_cursor       sys_refcursor;
        p_success_flag varchar2(100) := 'Success';
        p_num_rows     number := 0;
    begin
        update eba_sales_customers
        set
            customer_name = p_customer_name,
            customer_code = p_customer_code,
            customer_is_key_account_yn = p_customer_is_key_account_yn,
            customer_territory_id = to_number(p_customer_territory_id),
            account_source = p_account_source,
            industry_id = to_number(p_industry_id),
            gst_no = p_gst_no,
            classification_id = p_classification_id,
            pan_number = p_pan_number,
            email_address = p_email_address,
            phone_number = p_phone_number,
            mobile_number = p_mobile_number,
            default_rep_id = p_default_rep_id,
            customer_description = p_customer_description,
            customer_web_site = p_customer_web_site,
            tags = p_tags,
            created_by = p_created_by,
            updated_by = p_updated_by
        where
            id = to_number(p_acc_id);


                /* UPDATE EBA_SALES_CUSTOMERS
                   SET CUSTOMER_NAME=P_CUSTOMER_NAME, CUSTOMER_TERRITORY_ID =  P_CUSTOMER_TERRITORY_ID,CUSTOMER_INDUSTRY_ID=TO_NUMBER(P_CUSTOMER_INDUSTRY_ID),
                   CUSTOMER_ADDRESS1 =  P_CUSTOMER_ADDRESS1,CUSTOMER_ADDRESS2 =  P_CUSTOMER_ADDRESS2, CUSTOMER_CITY =  P_CUSTOMER_CITY, CUSTOMER_COUNTRY =  P_CUSTOMER_COUNTRY,
                   CUSTOMER_DESCRIPTION =  P_CUSTOMER_DESCRIPTION, CUSTOMER_WEB_SITE =  P_CUSTOMER_WEB_SITE,CUSTOMER_ACTIVE_STATUS = P_CUSTOMER_ACTIVE_STATUS, PRODUCT_USED   = P_PRODUCT_USED, 
                   STATUS = P_STATUS   WHERE ID=TO_NUMBER(P_ACC_ID);*/
        p_num_rows := sql%rowcount;
        if p_num_rows = 0 then
            p_success_flag := 'Failed';
        end if;
        open l_cursor for select
                              p_success_flag pmo_ords_response
                          from
                              dual;

        apex_json.open_object;
        apex_json.write('edit_account', l_cursor);
        apex_json.close_object;
    end edit_account;

	------- Add Contacts in Accounts---
    procedure add_account_contacts (
        p_contact_name        varchar2,
        p_acc_id              varchar2,
        p_date_of_birth       date,
        p_anniversary_day     date,
        p_department          varchar2,
        p_key_contact         varchar2,
        p_designation         varchar2,
        p_contact_email       varchar2,
        p_contact_phone       varchar2,
        p_contact_cell        varchar2,
        p_contact_address     varchar2,
        p_contact_linkedin    varchar2,
        p_contact_facebook    varchar2,
        p_contact_description varchar2,
        p_tags                varchar2,
        p_created_by          varchar2,
        p_updated_by          varchar2
    ) as
	-- l_cursor SYS_REFCURSOR;
        p_success_flag varchar2(240);
        l_ret          rowid;
    begin
        insert into eba_sales_customer_contacts (
            contact_name,
            customer_id,
            date_of_birth,
            anniversary_day,
            department,
            key_contact,
            designation,
            contact_email,
            contact_phone,
            contact_cell,
            contact_address,
            contact_linkedin,
            contact_facebook,
            contact_description,
            tags,
            created_by,
            updated_by
        ) values ( p_contact_name,
                   to_number(p_acc_id),
                   p_date_of_birth,
                   p_anniversary_day,
                   p_department,
                   p_key_contact,
                   p_designation,
                   p_contact_email,
                   p_contact_phone,
                   p_contact_cell,
                   p_contact_address,
                   p_contact_linkedin,
                   p_contact_facebook,
                   p_contact_description,
                   p_tags,
                   p_created_by,
                   p_updated_by ) returning rowid into l_ret;

        if l_ret is null then
            dbms_output.put_line('L_ret is null');
            p_success_flag := 'Failed';
        else
            dbms_output.put_line('L_ret else');
            p_success_flag := 'Success';
        end if;

        apex_json.open_object;
        apex_json.write('add_account_contacts', p_success_flag);
        apex_json.close_object;
    end add_account_contacts;

	--- Edit Contacts In Accounts----

    procedure edit_account_contact (
        p_contact_name        varchar2,
        p_acc_id              varchar2,
        p_contact_id          varchar2,
        p_date_of_birth       date,
        p_anniversary_day     date,
        p_department          varchar2,
        p_key_contact         varchar2,
        p_designation         varchar2,
        p_contact_email       varchar2,
        p_contact_phone       varchar2,
        p_contact_cell        varchar2,
        p_contact_address     varchar2,
        p_contact_linkedin    varchar2,
        p_contact_facebook    varchar2,
        p_contact_description varchar2,
        p_tags                varchar2,
        p_updated_by          varchar2
    ) as
        l_cursor       sys_refcursor;
        p_success_flag varchar2(100) := 'Success';
        p_num_rows     number := 0;
    begin
        update eba_sales_customer_contacts
        set
            contact_name = p_contact_name,
            date_of_birth = p_date_of_birth,
            anniversary_day = p_anniversary_day,
            department = p_department,
            key_contact = p_key_contact,
            designation = p_designation,
            contact_email = p_contact_email,
            contact_phone = p_contact_phone,
            contact_cell = p_contact_cell,
            contact_address = p_contact_address,
            contact_linkedin = p_contact_linkedin,
            contact_facebook = p_contact_facebook,
            contact_description = p_contact_description,
            tags = p_tags,
            updated_by = p_updated_by
        where
                customer_id = to_number(p_acc_id)
            and id = to_number(p_contact_id);

        p_num_rows := sql%rowcount;
        if p_num_rows = 0 then
            p_success_flag := 'Failed';
        end if;
        open l_cursor for select
                              p_success_flag pmo_ords_response
                          from
                              dual;

        apex_json.open_object;
        apex_json.write('edit_account_contacts', l_cursor);
        apex_json.close_object;
    end edit_account_contact;

-------------ADD Contacts---
    procedure add_contacts (
        p_contact_name        varchar2,
        p_acc_id              varchar2,
        p_date_of_birth       date,
        p_anniversary_day     date,
        p_department          varchar2,
        p_key_contact         varchar2,
        p_designation         varchar2,
        p_contact_email       varchar2,
        p_contact_phone       varchar2,
        p_contact_cell        varchar2,
        p_contact_address     varchar2,
        p_contact_linkedin    varchar2,
        p_contact_facebook    varchar2,
        p_contact_description varchar2,
        p_tags                varchar2,
        p_created_by          varchar2,
        p_updated_by          varchar2
    ) is
        p_success_flag varchar2(240) := 'Success';
        l_ret          rowid;
    begin
        insert into eba_sales_customer_contacts (
            contact_name,
            customer_id,
            date_of_birth,
            anniversary_day,
            department,
            key_contact,
            designation,
            contact_email,
            contact_phone,
            contact_cell,
            contact_address,
            contact_linkedin,
            contact_facebook,
            contact_description,
            tags,
            created_by,
            updated_by
        ) values ( p_contact_name,
                   to_number(p_acc_id),
                   p_date_of_birth,
                   p_anniversary_day,
                   p_department,
                   p_key_contact,
                   p_designation,
                   p_contact_email,
                   p_contact_phone,
                   p_contact_cell,
                   p_contact_address,
                   p_contact_linkedin,
                   p_contact_facebook,
                   p_contact_description,
                   p_tags,
                   p_created_by,
                   p_updated_by ) returning rowid into l_ret;

        if l_ret is null then
            dbms_output.put_line('L_ret is null - Failed');
            dbms_output.put_line(l_ret);
            p_success_flag := 'Failed';
        else
            dbms_output.put_line('L_ret else - Success');
            dbms_output.put_line(l_ret);
            p_success_flag := 'Success';
        end if;

        apex_json.open_object;
        apex_json.write('add_contacts', p_success_flag);
        apex_json.close_object;
    end add_contacts;
		-------------EDIT Contact---
    procedure edit_contact (
        p_contact_name        varchar2,
        p_acc_id              varchar2,
        p_contact_id          varchar2,
        p_date_of_birth       date,
        p_anniversary_day     date,
        p_department          varchar2,
        p_key_contact         varchar2,
        p_designation         varchar2,
        p_contact_email       varchar2,
        p_contact_phone       varchar2,
        p_contact_cell        varchar2,
        p_contact_address     varchar2,
        p_contact_linkedin    varchar2,
        p_contact_facebook    varchar2,
        p_contact_description varchar2,
        p_tags                varchar2,
        p_updated_by          varchar2
    ) as

        l_cursor       sys_refcursor;
        p_success_flag varchar2(100) := 'Success';
        p_num_rows     number := 0;
        l_id           number;
    begin
        update eba_sales_customer_contacts
        set
            contact_name = p_contact_name,
            date_of_birth = p_date_of_birth,
            anniversary_day = p_anniversary_day,
            department = p_department,
            key_contact = p_key_contact,
            designation = p_designation,
            contact_email = p_contact_email,
            contact_phone = p_contact_phone,
            contact_cell = p_contact_cell,
            contact_address = p_contact_address,
            contact_linkedin = p_contact_linkedin,
            contact_facebook = p_contact_facebook,
            contact_description = p_contact_description,
            tags = p_tags,
            updated_by = p_updated_by
        where
                customer_id = to_number(p_acc_id)
            and id = to_number(p_contact_id);

        open l_cursor for select
                             p_success_flag pmo_ords_response
                         from
                             dual;

        apex_json.open_object;
        apex_json.write('edit_contact', l_cursor);
        apex_json.close_object;
    end edit_contact;

----------***GETTING TERRITORY NAME FOR ADD ACCOUNT***--

    procedure get_territory as

        l_cursor          sys_refcursor;
        v_first_name      varchar2(255);
        v_role_name       varchar2(255);
        v_sales_rep       varchar2(1);
        v_user_id         number;
        p100_sales_person number;
        access_level_num  number;
        app_user_id       number;
        usr_group_id      number;
    begin
        open l_cursor for select distinct
                              'XXX' || id as id,
                              territory_name
                          from
                              eba_sales_territories;

        apex_json.open_object;
        apex_json.write('territory_name', l_cursor);
        apex_json.close_object;
    end get_territory;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
--***GETTING Industry NAME FOR ADD ACCOUNT***--

    procedure get_industry as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                'XXX' || id as id,
                                                industry_name
                                            from
                                                eba_sales_industries
                          order by
                              1;

        apex_json.open_object;
        apex_json.write('industry_name', l_cursor);
        apex_json.close_object;
    end;
	----------
	---***GETTING DEFAULT PEP FOR ADD ACCOUNT***---  

    procedure get_account_default_rep as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                rep_first_name
                                                || ' '
                                                || rep_last_name default_rep,
                                                id               default_rep_id
                                            from
                                                eba_sales_salesreps
                          order by
                              1;

        apex_json.open_object;
        apex_json.write('get_acc_default_rep', l_cursor);
        apex_json.close_object;
    end;

  ------ get account List---
    procedure get_account_lov (
        app_user_id number,
        app_user    varchar2
    ) is
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                c.customer_name account_name,
                                                'XXX' || c.id   account_id
                                            from
                                                eba_sales_customers c
                          order by
                              1;

        apex_json.open_object;
        apex_json.write('get_account_lov', l_cursor);
        apex_json.close_object;
    end get_account_lov;
------------- Get Classification ---

    procedure get_classification as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                class_name,
                                                class_id
                                            from
                                                xxeba_sales_classification
                          order by
                              1;

        apex_json.open_object;
        apex_json.write('get_Classification', l_cursor);
        apex_json.close_object;
    end;
--------- Get Source ------------
    procedure get_acc_source as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                lead_source,
                                                id
                                            from
                                                eba_sales_acc_sources
                          order by
                              1;

        apex_json.open_object;
        apex_json.write('get_Acc_Source', l_cursor);
        apex_json.close_object;
    end;

    procedure get_accounts (
        app_user     varchar2,
        app_user_id  number,
        territory_id number,
        p_cust_name  varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                'XXX' || c.id             as id,
                                                c.row_key,
                                                c.customer_name           customer_name,
                                                c.customer_code           customer_code,
                                                l.customer_address1
                                                || ' '
                                                || l.customer_address2
                                                || ' '
                                                || l.customer_postal_code address,
                                                (
                                                    select
                                                        city_name
                                                    from
                                                        xxeba_sales_cities_t
                                                    where
                                                        city_id = l.city_id
                                                )                         as customer_city,
                                                (
                                                    select
                                                        state
                                                    from
                                                        eba_sales_states
                                                    where
                                                        id = l.state_id
                                                )                         as customer_state,
                                                (
                                                    select
                                                        country_name
                                                    from
                                                        eba_sales_countries
                                                    where
                                                        id = l.country_id
                                                )                         as customer_country,
                                                c.customer_sic,
                                                c.customer_duns,
                                                c.customer_web_site       customer_web_site,
                                                c.customer_stock_symb,
                                                t.territory_name,
                                                decode(customer_is_key_account_yn, null, 'No', 'N', 'No',
                                                       'Y', 'Yes', 'No')  key_account,
                                                t.id                      territory_id,
				--
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_customer_locations
                                                    where
                                                        customer_id = c.id
                                                )                         locations,
				--
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_deals dx
                                                    where
                                                            dx.customer_id = c.id
                                                        and dx.deal_probability > 0
                                                        and dx.deal_probability < 100
                                                )                         open_deals,
				--
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_deals dx
                                                    where
                                                            dx.customer_id = c.id
                                                        and ( dx.deal_probability = 0
                                                              or dx.deal_probability = 100 )
                                                )                         close_deals,
				--
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_deals
                                                    where
                                                            customer_id = c.id
                                                        and deal_close_date < sysdate
                                                        and deal_probability != 0
                                                        and deal_probability != 100
                                                )                         past_due,
				--
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_customer_contacts
                                                    where
                                                        customer_id = c.id
                                                )                         contacts,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_leads
                                                    where
                                                        account_id = c.id
                                                )                         leads,
                                                (
                                                    select
                                                        rep_first_name
                                                        || ' '
                                                        || rep_last_name
                                                    from
                                                        eba_sales_salesreps
                                                    where
                                                        id = c.default_rep_id
                                                )                         as deafault_reps,
                                                c.tags,
                                                (
                                                    select
                                                        industry_name
                                                    from
                                                        eba_sales_industries
                                                    where
                                                        id = c.industry_id
                                                )                         industry,
                                                ( t.territory_name )      territories
                                            from
                                                eba_sales_customers          c,
                                                eba_sales_territories        t,
                                                eba_sales_customer_locations l
                          where
                                  c.default_rep_id = app_user_id
                              and c.customer_territory_id = t.id (+)
                              and ( nvl(territory_id, 0) = 0
                                    or t.id = nvl(territory_id, 0) )
                              and rownum <= 100
                              and upper(customer_name) like decode(p_cust_name,
                                                                   'ALL',
                                                                   upper(customer_name),
                                                                   '%'
                                                                   || upper(p_cust_name)
                                                                   || '%')
                              and ( upper(c.default_rep_id) in (
                                  select
                                      upper(r.id)
                                  from
                                      eba_sales_salesreps r
                                  start with
                                      r.id = app_user_id
                                  connect by
                                      prior r.id = r.rep_manager_id
                              )
                                    or exists (
                                  select
                                      'Y'
                                  from
                                      eba_sales_salesreps      r,
                                      eba_sales_salesrep_roles sr
                                  where
                                          r.id = app_user_id
                                      and sr.id = r.rep_role
                                      and sr.role_name = 'Administrator'
                              ) );

        apex_json.open_object;
        apex_json.write('get_accounts', l_cursor);
        apex_json.close_object;
    end get_accounts;

    procedure get_contacts (
        app_user_id number,
        app_user    varchar2
    ) is
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                'XXX' || cc.id  as id,
                                                cc.row_key,
                                                cc.contact_name,
                                                cc.contact_email,
                                                cc.contact_phone,
                                                cc.customer_id  account_id,
                                                c.customer_name account_name,
                                                cc.updated
                                            from
                                                eba_sales_customer_contacts cc,
                                                eba_sales_customers         c,
                                                eba_sales_territories       t
                          where
                                  c.id = cc.customer_id
                              and t.id = c.customer_territory_id
                              and ( upper(c.default_rep_id) in (
                                  select
                                      upper(r.id)
                                  from
                                      eba_sales_salesreps r
                                  start with
                                      r.id = app_user_id
                                  connect by
                                      prior r.id = r.rep_manager_id
                              )
                                    or exists (
                                  select
                                      'Y'
                                  from
                                      eba_sales_salesreps      r,
                                      eba_sales_salesrep_roles sr
                                  where
                                          r.id = app_user_id
                                      and sr.id = r.rep_role
                                      and sr.role_name = 'Administrator'
                              ) );

        apex_json.open_object;
        apex_json.write('get_contacts', l_cursor);
        apex_json.close_object;
    end get_contacts;



----------***GETTING SALES ORDER LIST OF AN USER***--

    procedure get_salesorderlist (
        app_user_id number
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                'XXX' || so.order_id          as order_id,
                                                so.order_number,
                                                'XXX' || so.deal_id           as deal_id,
                                                sd.deal_name,
                                                'XXX' || so.customer_id       as customer_id,
                                                sc.customer_name,
                                                'XXX' || so.territory_id      as territory_id,
                                                'XXX' || so.sales_rep         as sales_rep,
                                                sr.rep_first_name
                                                || ' '
                                                || sr.rep_last_name           rep_name,
                                                so.order_date,
                                                so.po_number,
                                                so.po_date,
                                                nvl(so.reference, '-')        reference,
                                                nvl(
                                                    xxeba_product_amount(so.order_id),
                                                    '0'
                                                )                             as total_amount,
                                                'XXX' || so.billing_location  as billing_location,
             --   CL.CUSTOMER_LOCATION_NAME BILLING,
                                                'XXX' || so.delivery_location as delivery_location,
             --   CL2.CUSTOMER_LOCATION_NAME DELIVERY,
                                                so.order_frequency,
                                                so.next_order_date,
                                                so.status
                                            from
                                                xxeba_sales_order   so,
                                                eba_sales_deals     sd,
                                                eba_sales_customers sc,
                                                eba_sales_salesreps sr
                   -- EBA_SALES_CUSTOMER_LOCATIONS CL,
                  -- EBA_SALES_CUSTOMER_LOCATIONS CL2
                          where  
      -- (UPPER(SC.CUSTOMER_NAME) LIKE '%'||UPPER(:P_CUSTOMER_NAME||'%') OR UPPER(SD.DEAL_NAME) LIKE '%'||UPPER(:P_CUSTOMER_NAME||'%'))

                                  so.deal_id = sd.id
                              and so.customer_id = sc.id
                              and so.sales_rep = sr.id
                              and ( upper(sc.default_rep_id) in (
                                  select
                                      upper(r.id)
                                  from
                                      eba_sales_salesreps r
                                  start with
                                      r.id = app_user_id
                                  connect by
                                      prior r.id = r.rep_manager_id
                              )
                                    or exists (
                                  select
                                      'Y'
                                  from
                                      eba_sales_salesreps      r,
                                      eba_sales_salesrep_roles sr
                                  where
                                          r.id = app_user_id
                                      and sr.id = r.rep_role
                                      and sr.role_name = 'Administrator'
                              )
                                    or exists (
                                  select
                                      'Y'
                                  from
                                      eba_sales_salesreps      r,
                                      eba_sales_salesrep_roles sr
                                  where
                                          r.id = app_user_id
                                      and sr.id = r.rep_role
                                      and sr.role_name = 'Sales Co-Ordinator'
                              ) )
                              and so.status = 'Y'
                              and rownum <= 50
                          order by
                              so.order_id;


               /*where --SO.DEAL_ID = SD.ID  
                 --   and SO.CUSTOMER_ID = SC.ID(+)    and 
                  SO.CUSTOMER_ID = SC.ID and rownum <=100
                --  and SO.SALES_REP = SR.ID(+)
                  and SO.SALES_REP = SR.ID
                  and SO.DELIVERY_LOCATION = CL.ID
                  and SO.BILLING_LOCATION = CL2.ID 
                  AND (upper(SC.DEFAULT_REP_ID) in (SELECT  upper(r.ID)
                                                         FROM eba_sales_salesreps r
                                                        START WITH r.id = APP_USER_ID
                                                       CONNECT BY PRIOR r.id= r.REP_MANAGER_ID) 
                     or 
                    EXISTS(select 'Y' from EBA_SALES_SALESREPS R, EBA_SALES_SALESREP_ROLES SR where R.id = APP_USER_ID and SR.ID = R.REP_ROLE and SR.ROLE_NAME = 'Administrator')
                    or 
                    EXISTS(select 'Y' from EBA_SALES_SALESREPS R, EBA_SALES_SALESREP_ROLES SR where R.id = APP_USER_ID and SR.ID = R.REP_ROLE and SR.ROLE_NAME = 'Sales Co-Ordinator'))
                    and SO.STATUS = 'Y'
                order by  SO.ORDER_ID desc;*/
        apex_json.open_object;
        apex_json.write('get_salesorderlist', l_cursor);
        apex_json.close_object;
    end get_salesorderlist;

----------***GETTING SALES ORDER ACCOUNT LIST OF AN USER***--

    procedure get_salesorder_accountlist (
        app_user_id number
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                sc.customer_name customer_name,
                                                'XXX' || sc.id   customer_id
                                            from
                                                eba_sales_customers sc
                          where
                              ( upper(sc.default_rep_id) in (
                                  select
                                      upper(r.id)
                                  from
                                      eba_sales_salesreps r
                                  start with
                                      r.id = app_user_id
                                  connect by
                                      prior r.id = r.rep_manager_id
                              )
                                or exists (
                                  select
                                      'Y'
                                  from
                                      eba_sales_salesreps      r,
                                      eba_sales_salesrep_roles sr
                                  where
                                          r.id = app_user_id
                                      and sr.id = r.rep_role
                                      and upper(sr.role_name) in ( 'ADMINISTRATOR', 'SALES CO-ORDINATOR' )
                              ) )
                          order by
                              1;

        apex_json.open_object;
        apex_json.write('get_salesorder_accountlist', l_cursor);
        apex_json.close_object;
    end get_salesorder_accountlist;


 ----------***GETTING SALES ORDER INFO BASED ON THE ACCOUNT***--

    procedure get_orderinfo_accountbase (
        p_customer_id number
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                t.territory_name,
                                                sr.rep_first_name
                                                || ' '
                                                || sr.rep_last_name              rep_name,
                                                'XXX' || c.default_rep_id        default_rep_id,
                                                'XXX' || c.customer_territory_id customer_territory_id
                                            from
                                                eba_sales_customers   c,
                                                eba_sales_territories t,
                                                eba_sales_salesreps   sr
                          where
                                  c.customer_territory_id = t.id
                              and c.default_rep_id = sr.id
                              and c.id = p_customer_id;

        apex_json.open_object;
        apex_json.write('get_orderinfo_accountbase', l_cursor);
        apex_json.close_object;
    end get_orderinfo_accountbase;

  ----------***ADDING NEW SALES ORDER***--------

    procedure add_sales_order (
        p_deal_name         varchar2,
        p_customer_id       varchar2,
        p_territory_id      varchar2,
        p_sales_rep         varchar2,
        p_po_number         varchar2,
        p_po_date           varchar2,
        p_reference         varchar2,
        p_billing_location  varchar2,
        p_delivery_location varchar2,
        p_order_frequency   number,
        p_next_order_date   varchar2,
        p_total_amount      number,
        p_order_date        varchar2,
                            -- P_ORDER_REPEAT VARCHAR2,
        p_latitude          varchar2,
        p_longitude         varchar2,
        p_order_type_id     number,
        p_created_by        varchar2
    ) as
	-- l_cursor SYS_REFCURSOR;
        p_success_flag   varchar2(240);
        l_ret            number;
        v_seq_num        number;
        v_order_number   varchar2(200);
        p_deal_id        varchar2(200);
        v_deal_status_id number;
    begin
        v_seq_num := xxfs_pm_leave_requests_seq.nextval();
        v_order_number := to_char(sysdate, 'YY')
                          || trim(to_char(v_seq_num, '00000'));

        select
            id
        into v_deal_status_id
        from
            eba_sales_deal_status_codes
        where
            corresponding_prob_pct = 100;

        insert into eba_sales_deals (
            deal_name,
            customer_id,
            salesrep_id_01,
    --DEAL_AMOUNT,
            deal_close_date,
            deal_status_code_id,
   -- LOCATION_ID,
            deal_probability
        ) values ( p_deal_name,
                   to_number(p_customer_id),
                   to_number(p_sales_rep),
    --P_TOTAL_AMOUNT,
                   sysdate,
                   v_deal_status_id,
    --:P173_LOCATION,
                   100 ) returning id into p_deal_id;

        insert into xxeba_sales_order (
            deal_id,
            customer_id,
            territory_id,
            sales_rep,
            po_number,
            po_date,
            reference,
            billing_location,
            delivery_location,
            order_frequency,
            next_order_date,
            order_number,
            order_date,
            order_repeat,
            latitude,
            longitude,
            created,
            created_by,
            updated_by,
            order_type_id,
            source_application
        ) values ( p_deal_id,
                   to_number(p_customer_id),
                   to_number(p_territory_id),
                   to_number(p_sales_rep),
                   p_po_number,
                   p_po_date,
                   p_reference,
                   to_number(p_billing_location),
                   to_number(p_delivery_location),
                   p_order_frequency,
                   p_next_order_date,
                   to_number(v_order_number),
                   p_order_date,
                   'N',
                   p_latitude,
                   p_longitude,
                   sysdate,
                   p_created_by,
                   p_created_by,
                   p_order_type_id,
                   'M' ) returning order_id into l_ret;

        commit;





        --dbms_output.put_line(ORDER_ID);
        dbms_output.put_line(p_deal_id);
        dbms_output.put_line(p_customer_id);
        dbms_output.put_line(p_territory_id);
        dbms_output.put_line(p_sales_rep);
        dbms_output.put_line(p_po_number);
        dbms_output.put_line(p_po_date);
        dbms_output.put_line(p_reference);
        dbms_output.put_line(p_billing_location);
        dbms_output.put_line(p_delivery_location);
        dbms_output.put_line(p_order_frequency);
        dbms_output.put_line(p_next_order_date);
        dbms_output.put_line(p_latitude);
        dbms_output.put_line(p_longitude);
        dbms_output.put_line(p_order_date);
        dbms_output.put_line(p_created_by);
        -- dbms_output.put_line(p_success_flag);

        if l_ret is null then
            dbms_output.put_line('L_ret is null - Failed');
            dbms_output.put_line(l_ret);
            p_success_flag := 'Failed';
        else
            dbms_output.put_line('L_ret else - Success');
            dbms_output.put_line(l_ret);
            p_success_flag := v_order_number
                              || '-'
                              || l_ret;
        end if;

        apex_json.open_object;
        apex_json.write('add_sales_order', p_success_flag);
        apex_json.close_object;
    end add_sales_order;
    ----------***GETTING PRODUCT LIST***--

    procedure get_product_list (
        p_search_prod varchar2
    ) as
        l_cursor sys_refcursor;

       /* BEGIN
        OPEN l_cursor for select p.PRODUCT_NAME||' ['||p.CATALOGUE_NO||']' PRODUCT_NAME, 'XXX' || p.ID PRODUCT_ID 
        from eba_sales_PRODUCTS p,eba_sales_verifications  v, XXEBA_SALES_PRODUCT_TYPES PT
        where p.ID =v.PRODUCT_ID
        and P.PRODUCT_TYPE_ID = PT.PRODUCT_TYPE_ID
        and p.status='Y'
        order by 1;*/
    begin
        open l_cursor for select
                                                p.product_name
                                                || ' ['
                                                || p.catalogue_no
                                                || ']'        product_name,
                                                'XXX' || p.id product_id
                                            from
                                                eba_sales_products        p,
                                                eba_sales_verifications   v,
                                                xxeba_sales_product_types pt
                          where
                                  p.id = v.product_id
                              and p.product_type_id = pt.product_type_id
                              and p.status = 'Y'
                              and upper(p.product_name) like '%'
                                                             || upper(p_search_prod)
                                                             || '%'
                          order by
                              1;

        apex_json.open_object;
        apex_json.write('get_product_list', l_cursor);
        apex_json.close_object;
    end get_product_list;

 ----------***GETTING PRODUCT INFO***-------

    procedure get_productinfo (
        p_product_id number
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                pf.product_family,
                                                round(p.product_price, 2)                                                as product_price
                                                ,
                                                p.currency_type,
                                                p.product_cost,
                                                p.brand_id,
       -- TO_CHAR(OP.DELIVERY_DATE) DELIVERY_DATE,
                                                (
                                                    select
                                                        brand_name as brand_name
                                                    from
                                                        xxeba_sales_product_brands
                                                    where
                                                        brand_id = p.brand_id
                                                )                                                                        brand_name,
                                                round(p.product_cost +(p.product_cost *(pf.margin_percentage / 100)), 0) minimum_price
                                            from
                                                eba_sales_product_families pf,
                                                eba_sales_products         p--, XXEBA_ORDER_PRODUCTS OP
                          where
                                  p.product_family_id = pf.id
                              and p.id = p_product_id;-- AND OP.ORDER_PRODUCTS_ID=P_PRODUCT_ID;
        apex_json.open_object;
        apex_json.write('get_productinfo', l_cursor);
        apex_json.close_object;
    end get_productinfo;

     ----------***GETTING BRAND LIST***-------

    procedure get_brand_list as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                brand_name as brand_name,
                                                brand_id   as brand_id
                                            from
                                                xxeba_sales_product_brands
                          order by
                              1;

        apex_json.open_object;
        apex_json.write('get_brand_list', l_cursor);
        apex_json.close_object;
    end get_brand_list;



     ----------***ADDING NEW PRODUCT FOR A SALES ORDER***--------

    procedure add_product_details (
        p_product_id        varchar2,
        p_product_name      varchar2,
        p_order_id          varchar2,
        p_close_date        varchar2,
        p_product_brand_id  number,
        p_product_price     number,
        p_currency_type     varchar2,
        p_special_appr_flag varchar2,
        p_quantity          number,
        p_created_by        varchar2
    ) as
	-- l_cursor SYS_REFCURSOR;
        p_success_flag varchar2(240);
        l_ret          rowid;
    begin

     /*INSERT INTO EBA_SALES_DEAL_PRODUCTS(   DEAL_ID,
                                            PRODUCT_ID,
                                            CLOSE_DATE,
                                            QTR,
                                            PRODUCT_BRAND_ID,
                                            PRODUCT_PRICE,
                                            CURRENCY_TYPE,
                                            QUANTITY,
                                            CREATED,
                                            CREATED_BY)
                                            VALUES
                                            (
                                             TO_NUMBER(P_DEAL_ID),
                                             TO_NUMBER(P_PRODUCT_ID),
                                             P_CLOSE_DATE,
                                             P_QTR,
                                            P_PRODUCT_BRAND_ID,
                                            P_PRODUCT_PRICE,
                                             P_CURRENCY_TYPE,
                                             P_QUANTITY,
                                             SYSDATE,
                                            P_CREATED_BY)  RETURNING ROWID INTO l_ret;*/

        insert into xxeba_order_products (
            product_id,
            product_name,
            order_id,
            delivery_date,
            brand_id,
            product_price,
            currency_type,
            quantity,
            created,
            created_by,
            updated_by
        ) values ( to_number(p_product_id),
                   p_product_name,
                   to_number(p_order_id),
                   p_close_date,
                   p_product_brand_id,
                   p_product_price,
                   p_currency_type,
                   p_quantity,
                   sysdate,
                   p_created_by,
                   p_created_by ) returning rowid into l_ret;

        if ( p_special_appr_flag = 'Y' ) then
            update xxeba_sales_order
            set
                status = 'N'
            where
                order_id = to_number(p_order_id);

        end if;

        commit;
        dbms_output.put_line(l_ret);
         --dbms_output.put_line(P_DEAL_ID);
        dbms_output.put_line(p_product_id);
        dbms_output.put_line(p_special_appr_flag);
        dbms_output.put_line(p_order_id);
--         dbms_output.put_line(P_CLOSE_DATE);
       /* dbms_output.put_line(P_QTR);
         dbms_output.put_line(P_PRODUCT_BRAND_ID);
         dbms_output.put_line(P_PRODUCT_PRICE);
         dbms_output.put_line(P_CURRENCY_TYPE);
         dbms_output.put_line(P_QUANTITY);*/
        dbms_output.put_line(p_created_by);
        dbms_output.put_line(p_success_flag);
        if l_ret is null then
            dbms_output.put_line('L_ret is null - Failed');
            dbms_output.put_line(l_ret);
            p_success_flag := 'Failed';
        else
            dbms_output.put_line('L_ret else - Success');
            dbms_output.put_line(l_ret);
            p_success_flag := 'Success';
        end if;

        apex_json.open_object;
        apex_json.write('add_product_details', p_success_flag);
        apex_json.close_object;
    exception
        when others then
            dbms_output.put_line('add_product_details'
                                 || dbms_utility.format_error_stack || dbms_utility.format_error_backtrace);
    end add_product_details;

     ----------***GETTING PRODUCT LIST***-------

    procedure get_pricelist as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                *
                                            from
                                                (
                                                    select
                                                        'XXX' || p.id  id,
                                                        p.product_name as product_name,
                                                        nvl(
                                                            round(product_price, 2),
                                                            0
                                                        )              product_price,
                                  --nvl(p.PRODUCT_PRICE,0) PRODUCT_PRICE,
                                                        p.currency_type,
                                                        p.unit_of_measure,
                                                        p.product_cost,
                                                        p.product_currency_type,
                                                        p.lead_time,
                                                        p.minimum_order_quantity,
                                                        p.row_key,
                                                        p.product_sku,
                                  --'XXX'||p.product_family_id product_family_id,
                                                        0              product_family_id,
                                                        p.catalogue_no,
                                                        p.product_description,
                                                        p.created,
                                                        p.created_by,
                                                        p.updated,
                                                        p.updated_by,
                                                        nvl((
                                                            select
                                                                sum(s.qty_in_stock)
                                                            from
                                                                xxeba_tally_stock_t s
                                                            where
                                                                    s.product_code = p.row_key
                                                                and s.batch_sequence =(
                                                                    select
                                                                        max(batch_sequence)
                                                                    from
                                                                        xxeba_tally_stock_t
                                                                )
                                                        ),
                                                            0)         stock
                                                    from
                                                        eba_sales_products p
                                                    where
                                                        p.status = 'Y'
                                                    order by
                                                        p.product_name asc,
                                                        p.updated desc
                                                )
                          where
                              rownum <= 200;

        apex_json.open_object;
        apex_json.write('get_pricelist', l_cursor);
        apex_json.close_object;
    end get_pricelist;


    ----------***SEARCH PRODUCT LIST***-------

    procedure get_search_pricelist (
        p_product_name varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                'XXX' || p.id  id,
                                                p.product_name as product_name,
                                                p.product_price,
                                                p.currency_type,
                                                p.unit_of_measure,
                                                p.product_cost,
                                                p.product_currency_type,
                                                p.lead_time,
                                                p.minimum_order_quantity,
                                                p.row_key,
                                                p.product_sku,
                                                p.product_family_id,
                                                p.catalogue_no,
                                                p.product_description,
                                                p.created,
                                                p.created_by,
                                                p.updated,
                                                p.updated_by,
                                                nvl((
                                                    select
                                                        sum(s.qty_in_stock)
                                                    from
                                                        xxeba_tally_stock_t s
                                                    where
                                                            s.product_code = p.row_key
                                                        and s.batch_sequence =(
                                                            select
                                                                max(batch_sequence)
                                                            from
                                                                xxeba_tally_stock_t
                                                        )
                                                ),
                                                    0)         stock
                                            from
                                                eba_sales_products p
                          where
                              ( upper(p.product_name) like '%' || upper(p_product_name || '%')
                                or upper(p.catalogue_no) like '%' || upper(p_product_name || '%') )
                          order by
                              product_name asc;

        apex_json.open_object;
        apex_json.write('get_pricelist', l_cursor);
        apex_json.close_object;
    end get_search_pricelist;

     ----------***SEARCH PRODUCT LIST***-------

   ----------***SEARCH PRODUCT LIST***-------

    procedure get_appointments_list (
        p_user_id varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                'XXX' || a.appt_id                                          appt_id,
                                                c.customer_name,
                                                'XXX' || c.id                                               customer_id,
                                                'XXX' || a.salesrep_id                                      salesrep_id,
                                                sr.rep_first_name
                                                || ' '
                                                || sr.rep_last_name                                         salesreps,
                                                t.territory_name,
                                                a.appointment_type,
                                                a.appointment_date,
                                                (
                                                    select
                                                        contact_name
                                                    from
                                                        eba_sales_customer_contacts
                                                    where
                                                        id = a.contact_person_id
                                                )                                                           as contact_person,
                                                to_char(a.appointment_date, 'DD-Mon-YYYY')                  as appt_date,
                                                to_char(a.appointment_date, 'HH12:MI AM')                   as appt_time,
                                                nvl(a.comments, 'Nil')                                      status_comments,
                                                nvl(a.status_comments, 'Nil')                               reason,
                                                nvl(a.appointment_purpose, 'Nil')                           appointment_purpose,
                                                nvl(a.appointment_status, 'Nil')                            appointment_status,
                                                nvl((to_char(a.visited_on, 'DD-Mon-YYYY')),
                                                    '-')                                                    visited_on,
                                                decode(a.appointment_source, 'P', 'Planned', 'D', 'Direct') appointment_source,
                                                a.limit_existed
                                            from
                                                xxeba_sales_crm_appointments a,
                                                eba_sales_customers          c,
                                                eba_sales_salesreps          sr,
                                                eba_sales_territories        t
                          where
                                  c.id = a.customer_id
                              and c.default_rep_id = sr.id
                              and c.customer_territory_id = t.id
                              and ( upper(c.default_rep_id) in (
                                  select
                                      upper(r.id)
                                  from
                                      eba_sales_salesreps r
                                  start with
                                      r.id = p_user_id
                                  connect by
                                      prior r.id = r.rep_manager_id
                              )
                                    or exists (
                                  select
                                      'Y'
                                  from
                                      eba_sales_salesreps      r,
                                      eba_sales_salesrep_roles sr
                                  where
                                          r.id = p_user_id
                                      and sr.id = r.rep_role
                                      and sr.role_name = 'Administrator'
                              ) )
                              and trunc(a.appointment_date) >= trunc(sysdate)
                          order by
                              a.appointment_date asc;

        apex_json.open_object;
        apex_json.write('get_appointments_list', l_cursor);
        apex_json.close_object;
    end get_appointments_list;

    ----------***SEARCH PRODUCT LIST***-------

    procedure get_search_appointments (
        p_user_id       varchar2,
        p_customer_name varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                a.appt_id,
                                                c.customer_name,
                                                a.salesrep_id,
                                                sr.rep_first_name
                                                || ' '
                                                || sr.rep_last_name                                         salesreps,
                                                t.territory_name,
                                                a.appointment_type,
                                                a.appointment_date,
                                                a.appointment_purpose,
                                                a.appointment_status,
                                                a.visited_on,
                                                decode(a.appointment_source, 'P', 'Planned', 'D', 'Direct') appointment_source,
                                                a.limit_existed
                                            from
                                                xxeba_sales_crm_appointments a,
                                                eba_sales_customers          c,
                                                eba_sales_salesreps          sr,
                                                eba_sales_territories        t
                          where
                                  c.id = a.customer_id
                              and c.default_rep_id = sr.id
                              and c.customer_territory_id = t.id
                              and ( upper(c.default_rep_id) in (
                                  select
                                      upper(r.id)
                                  from
                                      eba_sales_salesreps r
                                  start with
                                      r.id = p_user_id
                                  connect by
                                      prior r.id = r.rep_manager_id
                              )
                                    or exists (
                                  select
                                      'Y'
                                  from
                                      eba_sales_salesreps      r,
                                      eba_sales_salesrep_roles sr
                                  where
                                          r.id = p_user_id
                                      and sr.id = r.rep_role
                                      and sr.role_name = 'Administrator'
                              ) )
                              and trunc(a.appointment_date) >= trunc(sysdate)
                              and upper(c.customer_name) like '%' || upper(p_customer_name || '%')
                          order by
                              a.appointment_date desc;

        apex_json.open_object;
        apex_json.write('get_search_appointments', l_cursor);
        apex_json.close_object;
    end get_search_appointments;


    ----------***EDIT SALES ORDER***-------

    procedure edit_sales_order (
        p_order_id          varchar2,
        p_po_number         varchar2,
        p_po_date           varchar2,
        p_reference         varchar2,
        p_billing_location  varchar2,
        p_delivery_location varchar2,
        p_order_frequency   number,
        p_order_date        varchar2,
        p_next_order_date   varchar2,
        p_latitude          varchar2,
        p_longitude         varchar2,
        p_updated_by        varchar2
    ) as
        l_cursor       sys_refcursor;
        p_success_flag varchar2(100) := 'Success';
        p_num_rows     number := 0;
    begin
        update xxeba_sales_order
        set
            po_number = p_po_number,
            po_date = p_po_date,
            reference = p_reference,
            billing_location = to_number(p_billing_location),
            delivery_location = to_number(p_delivery_location),
            order_frequency = p_order_frequency,
            order_date = p_order_date,
            next_order_date = p_next_order_date,
            last_updated_latitude = p_latitude,
            last_updated_longitude = p_longitude,
            updated = sysdate,
            updated_by = p_updated_by
        where
            order_id = to_number(p_order_id);

        p_num_rows := sql%rowcount;
        if p_num_rows = 0 then
            p_success_flag := 'Failed';
        end if;
        commit;
        dbms_output.put_line(p_order_id);
        dbms_output.put_line(p_po_number);
        dbms_output.put_line(p_po_date);
        dbms_output.put_line(p_reference);
        dbms_output.put_line(p_billing_location);
        dbms_output.put_line(p_delivery_location);
        dbms_output.put_line(p_order_frequency);
        dbms_output.put_line(p_order_date);
        dbms_output.put_line(p_next_order_date);
        dbms_output.put_line(sysdate);
        dbms_output.put_line(p_updated_by);
        dbms_output.put_line(p_success_flag);
        open l_cursor for select
                              p_success_flag pmo_ords_response
                          from
                              dual;

        apex_json.open_object;
        apex_json.write('edit_salesorder', l_cursor);
        apex_json.close_object;
    end edit_sales_order;   



  ----------***GETTING SALES ORDER LIST OF AN USER***--

    procedure get_search_salesorderlist (
        app_user_id     number,
        p_customer_name varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                'XXX' || so.order_id          as order_id,
                                                so.order_number,
                                                'XXX' || so.deal_id           as deal_id,
                                                sd.deal_name,
                                                'XXX' || so.customer_id       as customer_id,
                                                sc.customer_name,
                                                'XXX' || so.territory_id      as territory_id,
                                                'XXX' || so.sales_rep         as sales_rep,
                                                sr.rep_first_name
                                                || ' '
                                                || sr.rep_last_name           rep_name,
                                                so.order_date,
                                                so.po_number,
                                                so.po_date,
                                                so.reference,
                                                'XXX' || so.billing_location  as billing_location,
                --CL.CUSTOMER_LOCATION_NAME BILLING,
                                                'XXX' || so.delivery_location as delivery_location,
                --CL2.CUSTOMER_LOCATION_NAME DELIVERY,
                                                so.order_frequency,
                                                so.next_order_date,
                                                so.status
                                            from
                                                xxeba_sales_order   so,
                                                eba_sales_deals     sd,
                                                eba_sales_customers sc,
                                                eba_sales_salesreps sr
                          where
                              ( upper(sc.customer_name) like '%' || upper(p_customer_name || '%')
                                or upper(sd.deal_name) like '%' || upper(p_customer_name || '%') )
                              and so.deal_id = sd.id
                              and so.customer_id = sc.id
                              and so.sales_rep = sr.id
                              and ( upper(sc.default_rep_id) in (
                                  select
                                      upper(r.id)
                                  from
                                      eba_sales_salesreps r
                                  start with
                                      r.id = app_user_id
                                  connect by
                                      prior r.id = r.rep_manager_id
                              )
                                    or exists (
                                  select
                                      'Y'
                                  from
                                      eba_sales_salesreps      r,
                                      eba_sales_salesrep_roles sr
                                  where
                                          r.id = app_user_id
                                      and sr.id = r.rep_role
                                      and sr.role_name = 'Administrator'
                              )
                                    or exists (
                                  select
                                      'Y'
                                  from
                                      eba_sales_salesreps      r,
                                      eba_sales_salesrep_roles sr
                                  where
                                          r.id = app_user_id
                                      and sr.id = r.rep_role
                                      and sr.role_name = 'Sales Co-Ordinator'
                              ) )
                              and so.status = 'Y';
--order by  SO.ORDER_ID
               /* from XXEBA_SALES_ORDER SO,
                    EBA_SALES_DEALS SD,
                    EBA_SALES_CUSTOMERS SC,
                    EBA_SALES_SALESREPS SR,
                    EBA_SALES_CUSTOMER_LOCATIONS CL,
                    EBA_SALES_CUSTOMER_LOCATIONS CL2
                where SO.DEAL_ID = SD.ID  
                and  (UPPER(SC.CUSTOMER_NAME) LIKE '%'||UPPER(P_CUSTOMER_NAME||'%') OR UPPER(SD.DEAL_NAME) LIKE '%'||UPPER(P_CUSTOMER_NAME||'%'))
                 --   and SO.CUSTOMER_ID = SC.ID(+)
                     and SO.CUSTOMER_ID = SC.ID
                --  and SO.SALES_REP = SR.ID(+)
                  and SO.SALES_REP = SR.ID
                  and SO.DELIVERY_LOCATION = CL.ID
                  and SO.BILLING_LOCATION = CL2.ID 
                  AND (upper(SC.DEFAULT_REP_ID) in (SELECT  upper(r.ID)
                                                         FROM eba_sales_salesreps r
                                                        START WITH r.id = APP_USER_ID
                                                       CONNECT BY PRIOR r.id= r.REP_MANAGER_ID) 
                     or 
                    EXISTS(select 'Y' from EBA_SALES_SALESREPS R, EBA_SALES_SALESREP_ROLES SR where R.id = APP_USER_ID and SR.ID = R.REP_ROLE and SR.ROLE_NAME = 'Administrator')
                    or 
                    EXISTS(select 'Y' from EBA_SALES_SALESREPS R, EBA_SALES_SALESREP_ROLES SR where R.id = APP_USER_ID and SR.ID = R.REP_ROLE and SR.ROLE_NAME = 'Sales Co-Ordinator'))
                    and SO.STATUS = 'Y';*/

              --  order by  SO.ORDER_ID;
        apex_json.open_object;
        apex_json.write('get_salesorderlist', l_cursor);
        apex_json.close_object;
    end get_search_salesorderlist;


    ----------***GETTING PRODUCTS***--

    procedure get_products (
        p_order_id varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                'XXX' || order_products_id order_products_id,
                                                'XXX' || order_id          order_id,
                                                product_name,
                                                product_price,
                                                currency_type,
                                                brand_id,
                                                quantity,
                                                delivery_date
                                            from
                                                xxeba_order_products
                          where
                              order_id = p_order_id;

        apex_json.open_object;
        apex_json.write('get_products', l_cursor);
        apex_json.close_object;
    end get_products;


    ----------***EDIT PRODUCT IN SALES ORDER***-------

    procedure edit_salesorder_product (
        p_order_products_id varchar2,
        p_product_price     number,
        p_quantity          number,
        p_delivery_date     varchar2,
        p_updated_by        varchar2
    ) as
        l_cursor       sys_refcursor;
        p_success_flag varchar2(100) := 'Success';
        p_num_rows     number;
    begin
        update xxeba_order_products
        set
            product_price = p_product_price,
            quantity = p_quantity,
            delivery_date = p_delivery_date,
            updated = sysdate,
            updated_by = p_updated_by
        where
            order_id = to_number(p_order_products_id);

        p_num_rows := sql%rowcount;
        if p_num_rows = 0 then
            p_success_flag := 'Failed';
        end if;
        commit;
        dbms_output.put_line(p_num_rows);
        dbms_output.put_line(p_order_products_id);
        dbms_output.put_line(p_product_price);
        dbms_output.put_line(p_quantity);
        dbms_output.put_line(p_updated_by);
        open l_cursor for select
                              p_success_flag pmo_ords_response
                          from
                              dual;

        apex_json.open_object;
        apex_json.write('edit_salesorder_product', l_cursor);
        apex_json.close_object;
    end edit_salesorder_product;   

    ----------***DELETE PRODUCT IN SALES ORDER***-------

    procedure delete_salesorder_product (
        p_order_products_id varchar2
    ) as
        l_cursor       sys_refcursor;
        p_success_flag varchar2(100) := 'Success';
        row_count      number := 0;
--   P_Data_available VARACHAR2;  
    begin
        delete from xxeba_order_products
        where
            order_products_id = to_number(p_order_products_id);

        commit;
        select
            count(*)
        into row_count
        from
            xxeba_order_products
        where
            order_products_id = to_number(p_order_products_id);

        if row_count <> 0 then
            p_success_flag := 'Failed';
        end if;
        dbms_output.put_line(row_count);
        dbms_output.put_line(p_success_flag);
        dbms_output.put_line(p_order_products_id);
        open l_cursor for select
                              p_success_flag pmo_ords_response
                          from
                              dual;

        apex_json.open_object;
        apex_json.write('delete_salesorder_product', l_cursor);
        apex_json.close_object;
    end delete_salesorder_product;   

  -------GET ACCOUNT(NEW UPDATED)--------- 

    procedure get_accounts_venturi (
        p_user_id varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                'XXX' || c.id                      id,
                                                c.row_key,
                                                c.customer_code,
                                                c.gst_no,
                                                nvl(cc.key_contact, '-')           key_contact,
                                                cc.contact_name,
                                                'XXX' || cc.id                     contact_id,
                                                c.customer_name,
                                                nvl(c.last_updated_latitude, '-')  latitude,
                                                nvl(c.last_updated_longitude, '-') longitude,
                                                (
                                                    select
                                                        rep.rep_first_name
                                                        || ' '
                                                        || rep.rep_last_name
                                                    from
                                                        eba_sales_salesreps rep
                                                    where
                                                        id = default_rep_id
                                                )                                  as default_rep,
                                                'XXX' || c.default_rep_id          default_rep_id,
                                                t.territory_name,
                                                'XXX' || c.customer_territory_id   customer_territory_id,
                                                'XXX'
                                                || (
                                                    case
                                                        when cc.key_contact = 'Y' then
                                                            sf.id
                                                        else
                                                            0
                                                    end
                                                )                                  as photo_id,
                                                case c.customer_is_key_account_yn
                                                    when 'Y' then
                                                        'Yes'
                                                    when 'N' then
                                                        'No'
                                                end                                customer_is_key_account_yn,
                                                c.tags,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_links
                                                    where
                                                        account_id = c.id
                                                )                                  links,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_files
                                                    where
                                                        account_id = c.id
                                                )                                  attachments,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_comments
                                                    where
                                                        account_id = c.id
                                                )                                  comments,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_verifications
                                                    where
                                                        cust_id = c.id
                                                )                                  validations,
                                                (
                                                    select
                                                        max(created)
                                                    from
                                                        eba_sales_verifications
                                                    where
                                                        cust_id = c.id
                                                )                                  last_validation,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_clicks
                                                    where
                                                            cust_id = c.id
                                                        and view_timestamp >= sysdate - 90
                                                )                                  views_90_days,
                                                (
                                                    select
                                                        count(distinct(app_username))
                                                    from
                                                        eba_sales_clicks
                                                    where
                                                            cust_id = c.id
                                                        and view_timestamp >= sysdate - 90
                                                )                                  users_90_days,
                                                c.created,
                                                c.created_by,
                                                c.updated,
                                                c.updated_by,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_deals dx
                                                    where
                                                            dx.customer_id = c.id
                                                        and dx.deal_probability > 0
                                                        and dx.deal_probability < 100
                                                )                                  open_deals,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_deals
                                                    where
                                                            customer_id = c.id
                                                        and deal_close_date < sysdate
                                                        and deal_probability != 0
                                                        and deal_probability != 100
                                                )                                  past_due,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_leads
                                                    where
                                                        account_id = c.id
                                                )                                  leads
                                            from
                                                eba_sales_customers         c
                                                left join eba_sales_territories       t on c.customer_territory_id = t.id
                                                left outer join eba_sales_customer_contacts cc on c.id = cc.customer_id
                                                left outer join eba_sales_files             sf on cc.id = sf.contact_id
                          where
                                  cc.key_contact = 'Y'
                              and ( upper(c.default_rep_id) in (
                                  select
                                      upper(r.id)
                                  from
                                      eba_sales_salesreps r
                                  start with
                                      r.id = to_number(p_user_id)
                                  connect by
                                      prior r.id = r.rep_manager_id
                              )
                                    or exists (
                                  select
                                      'Y'
                                  from
                                      eba_sales_salesreps      r,
                                      eba_sales_salesrep_roles sr
                                  where
                                          r.id = to_number(p_user_id)
                                      and sr.id = r.rep_role
                                      and sr.role_name = 'Administrator'
                              ) )
                              and rownum <= 100;













      /*  select 'XXX'||c.id ID,
                      c.row_key,C.CUSTOMER_CODE,C.GST_NO,C.CLASSIFICATION_ID,
                      c.customer_name,
                     (SELECT rep.REP_FIRST_NAME||' '||rep.REP_LAST_NAME  from eba_sales_salesreps rep where ID = default_rep_id) as default_rep,
                      'XXX'||c.default_rep_id default_rep_id,
                      t.territory_name,
                       'XXX'||c.customer_territory_id customer_territory_id,
                      case c.customer_is_key_account_yn
                        when 'Y' then 'Yes'
                        when 'N' then 'No'
                      end customer_is_key_account_yn,
                      c.tags,
                      (
                        select count(*)
                        from eba_sales_links
                        where account_id = c.id
                      ) links,
                      (
                        select count(*)
                        from eba_sales_files
                        where account_id = c.id
                      ) attachments,
                      (
                        select count(*)
                        from eba_sales_comments
                        where account_id = c.id
                      ) comments,
                      (
                        select count(*)
                        from eba_sales_verifications
                        where cust_id = c.id
                      ) validations,
                      (
                        select max(created)
                        from eba_sales_verifications
                        where cust_id = c.id
                      ) last_validation,
                      (
                        select count(*)
                        from eba_sales_clicks
                        where cust_id = c.id
                          and view_timestamp >= sysdate - 90
                      ) views_90_days,
                        (   select count(distinct(app_username))
                            from eba_sales_clicks
                            where cust_id = c.id
                                and view_timestamp >= sysdate - 90 ) users_90_days,
                      c.created,
                      c.created_by,
                      c.updated,
                      c.updated_by,
                      (
                        select count(*)
                        from eba_sales_deals dx
                        where dx.customer_id = c.id
                          and dx.deal_probability > 0
                          and dx.deal_probability < 100
                      ) open_deals,
                      (
                        select count(*)
                        from eba_sales_deals
                        where customer_id = c.id
                          and deal_close_date < sysdate
                          and deal_probability != 0
                          and deal_probability != 100
                      ) past_due,
                      (
                        select count(*)
                        from eba_sales_leads
                        where account_id = c.id
                      ) leads
                    from eba_sales_customers c
                    left join eba_sales_territories t
                      on c.customer_territory_id = t.id
                    where (upper(c.DEFAULT_REP_ID) in (SELECT  upper(r.ID)
                                           FROM eba_sales_salesreps r
                                                            START WITH r.id = TO_NUMBER(P_USER_ID)
                                                           CONNECT BY PRIOR r.id= r.REP_MANAGER_ID)
                         or
                        EXISTS(select 'Y' from EBA_SALES_SALESREPS R, EBA_SALES_SALESREP_ROLES SR where R.id = TO_NUMBER(P_USER_ID) and SR.ID = R.REP_ROLE and SR.ROLE_NAME = 'Administrator')
                        );*/


                                  --  order by  SO.ORDER_ID;
        apex_json.open_object;
        apex_json.write('get_accounts', l_cursor);
        apex_json.close_object;
    end get_accounts_venturi;



  -------SEARCHING ACCOUNT(NEW UPDATED) BASED ON CUSTOMER NAME--------- 

    procedure get_search_accounts (
        p_user_id       varchar2,
        p_customer_name varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                c.id,
                                                c.row_key,
                                                c.customer_code,
                                                c.gst_no,
                                                c.classification_id,
                                                c.customer_name,
                                                'XXX' || c.default_rep_id        default_rep_id,
                                                t.territory_name,
                                                'XXX' || c.customer_territory_id customer_territory_id,
                                                case c.customer_is_key_account_yn
                                                    when 'Y' then
                                                        'Yes'
                                                    when 'N' then
                                                        'No'
                                                end                              customer_is_key_account_yn,
                                                c.tags,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_links
                                                    where
                                                        account_id = c.id
                                                )                                links,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_files
                                                    where
                                                        account_id = c.id
                                                )                                attachments,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_comments
                                                    where
                                                        account_id = c.id
                                                )                                comments,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_verifications
                                                    where
                                                        cust_id = c.id
                                                )                                validations,
                                                (
                                                    select
                                                        max(created)
                                                    from
                                                        eba_sales_verifications
                                                    where
                                                        cust_id = c.id
                                                )                                last_validation,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_clicks
                                                    where
                                                            cust_id = c.id
                                                        and view_timestamp >= sysdate - 90
                                                )                                views_90_days,
                                                (
                                                    select
                                                        count(distinct(app_username))
                                                    from
                                                        eba_sales_clicks
                                                    where
                                                            cust_id = c.id
                                                        and view_timestamp >= sysdate - 90
                                                )                                users_90_days,
                                                c.created,
                                                c.created_by,
                                                c.updated,
                                                c.updated_by,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_deals dx
                                                    where
                                                            dx.customer_id = c.id
                                                        and dx.deal_probability > 0
                                                        and dx.deal_probability < 100
                                                )                                open_deals,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_deals
                                                    where
                                                            customer_id = c.id
                                                        and deal_close_date < sysdate
                                                        and deal_probability != 0
                                                        and deal_probability != 100
                                                )                                past_due,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_leads
                                                    where
                                                        account_id = c.id
                                                )                                leads
                                            from
                                                eba_sales_customers   c
                                                left join eba_sales_territories t on c.customer_territory_id = t.id
                          where
                              ( upper(c.default_rep_id) in (
                                  select
                                      upper(r.id)
                                  from
                                      eba_sales_salesreps r
                                  start with
                                      r.id = to_number(p_user_id)
                                  connect by
                                      prior r.id = r.rep_manager_id
                              )
                                or exists (
                                  select
                                      'Y'
                                  from
                                      eba_sales_salesreps      r,
                                      eba_sales_salesrep_roles sr
                                  where
                                          r.id = to_number(p_user_id)
                                      and sr.id = r.rep_role
                                      and sr.role_name = 'Administrator'
                              ) )
                              and upper(c.customer_name) like '%' || upper(p_customer_name || '%');

                                  --  order by  SO.ORDER_ID;
        apex_json.open_object;
        apex_json.write('get_accounts', l_cursor);
        apex_json.close_object;
    end get_search_accounts;


 -------GET CONTACTS(NEW UPDATED)--------- 

    procedure get_contacts_venturi (
        p_user_id varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                'XXX' || cc.id           id,
                                                cc.row_key,
                                                cc.contact_name,
                                                cc.department,
                                                cc.date_of_birth,
                                                cc.anniversary_day,
                                                cc.designation,
                                                nvl(cc.key_contact, '-') key_contact,
                                                cc.contact_email,
                                                cc.contact_phone,
                                                cc.contact_cell,
                                                cc.contact_address,
                                                cc.contact_description,
                                                cc.contact_linkedin,
                                                cc.contact_facebook,
                                                cc.contact_twitter,
                                                'XXX' || cc.customer_id  customer_id,
                                                c.customer_name          account,
                                                cc.tags,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_links
                                                    where
                                                        contact_id = cc.id
                                                )                        links,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_files
                                                    where
                                                        contact_id = cc.id
                                                )                        attachments,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_comments
                                                    where
                                                        contact_id = cc.id
                                                )                        comments,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_verifications
                                                    where
                                                        contact_id = cc.id
                                                )                        validations,
                                                (
                                                    select
                                                        max(created)
                                                    from
                                                        eba_sales_verifications
                                                    where
                                                        contact_id = cc.id
                                                )                        last_validation,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_clicks
                                                    where
                                                            contact_id = cc.id
                                                        and view_timestamp >= sysdate - 90
                                                )                        views_90_days,
                                                (
                                                    select
                                                        count(distinct(app_username))
                                                    from
                                                        eba_sales_clicks
                                                    where
                                                            contact_id = cc.id
                                                        and view_timestamp >= sysdate - 90
                                                )                        users_90_days,
                                                cc.created,
                                                cc.created_by,
                                                cc.updated,
                                                cc.updated_by,
                                                t.territory_name,
                                                'XXX' || t.id            territory_id
                                            from
                                                     eba_sales_customer_contacts cc
                                                join eba_sales_customers   c on c.id = cc.customer_id
                                                left join eba_sales_territories t on t.id = c.customer_territory_id
                          where
                              ( upper(c.default_rep_id) in (
                                  select
                                      upper(r.id)
                                  from
                                      eba_sales_salesreps r
                                  start with
                                      r.id = p_user_id
                                  connect by
                                      prior r.id = r.rep_manager_id
                              )
                                or exists (
                                  select
                                      'Y'
                                  from
                                      eba_sales_salesreps      r,
                                      eba_sales_salesrep_roles sr
                                  where
                                          r.id = p_user_id
                                      and sr.id = r.rep_role
                                      and sr.role_name = 'Administrator'
                              ) )
                              and rownum <= 100;

                                  --  order by  SO.ORDER_ID;
        apex_json.open_object;
        apex_json.write('get_contacts', l_cursor);
        apex_json.close_object;
    end get_contacts_venturi;

  -------SEARCHING CONTACTS(NEW UPDATED) BASED ON CUSTOMER NAME--------- 

    procedure get_search_contacts (
        p_user_id      varchar2,
        p_contact_name varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                'XXX' || cc.id          id,
                                                cc.row_key,
                                                cc.contact_name,
                                                cc.department,
                                                cc.date_of_birth,
                                                cc.anniversary_day,
                                                cc.designation,
                                                cc.key_contact,
                                                cc.contact_email,
                                                cc.contact_phone,
                                                cc.contact_cell,
                                                cc.contact_address,
                                                cc.contact_description,
                                                cc.contact_linkedin,
                                                cc.contact_facebook,
                                                cc.contact_twitter,
                                                'XXX' || cc.customer_id customer_id,
                                                c.customer_name         account,
                                                cc.tags,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_links
                                                    where
                                                        contact_id = cc.id
                                                )                       links,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_files
                                                    where
                                                        contact_id = cc.id
                                                )                       attachments,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_comments
                                                    where
                                                        contact_id = cc.id
                                                )                       comments,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_verifications
                                                    where
                                                        contact_id = cc.id
                                                )                       validations,
                                                (
                                                    select
                                                        max(created)
                                                    from
                                                        eba_sales_verifications
                                                    where
                                                        contact_id = cc.id
                                                )                       last_validation,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_clicks
                                                    where
                                                            contact_id = cc.id
                                                        and view_timestamp >= sysdate - 90
                                                )                       views_90_days,
                                                (
                                                    select
                                                        count(distinct(app_username))
                                                    from
                                                        eba_sales_clicks
                                                    where
                                                            contact_id = cc.id
                                                        and view_timestamp >= sysdate - 90
                                                )                       users_90_days,
                                                cc.created,
                                                cc.created_by,
                                                cc.updated,
                                                cc.updated_by,
                                                t.territory_name,
                                                'XXX' || t.id           territory_id
                                            from
                                                     eba_sales_customer_contacts cc
                                                join eba_sales_customers   c on c.id = cc.customer_id
                                                left join eba_sales_territories t on t.id = c.customer_territory_id
                          where
                              ( upper(cc.contact_name) like '%' || upper(p_contact_name || '%')
                                or upper(c.customer_name) like '%' || upper(p_contact_name || '%') )
                              and ( upper(c.default_rep_id) in (
                                  select
                                      upper(r.id)
                                  from
                                      eba_sales_salesreps r
                                  start with
                                      r.id = p_user_id
                                  connect by
                                      prior r.id = r.rep_manager_id
                              )
                                    or exists (
                                  select
                                      'Y'
                                  from
                                      eba_sales_salesreps      r,
                                      eba_sales_salesrep_roles sr
                                  where
                                          r.id = p_user_id
                                      and sr.id = r.rep_role
                                      and sr.role_name = 'Administrator'
                              ) );
                                  --  order by  SO.ORDER_ID;
        apex_json.open_object;
        apex_json.write('get_contacts', l_cursor);
        apex_json.close_object;
    end get_search_contacts;

-------GET OPPORTUNITIES(NEW UPDATED)--------- 

    procedure get_opportunities_venturi (
        p_user_id varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                'XXX' || d.id       id,
                                                d.row_key,
                                                d.deal_name,
                                                'XXX' || t.id       territory_id,
                                                t.territory_name,
                                                'XXX' || c.id       account_id,
                                                c.customer_name     account,
                                                d.deal_amount,
                                                nvl((
                                                    select
                                                        sum(nvl(dp.quote_price, 0))
                                                    from
                                                        eba_sales_deal_products dp
                                                    where
                                                            dp.deal_id = d.id
                                                        and dp.term is not null
                                                ),
                                                    0)              as calculated_amount,
                                                nvl((
                                                    select
                                                        sum(nvl(dp.quote_price, 0))
                                                    from
                                                        eba_sales_deal_products dp
                                                    where
                                                            dp.deal_id = d.id
                                                        and dp.term is null
                                                ),
                                                    0)              as calculated_opp,
                                                nvl((
                                                    select
                                                        sum(nvl(dp.tcv, 0))
                                                    from
                                                        eba_sales_deal_products dp
                                                    where
                                                            dp.deal_id = d.id
                                                        and dp.term is not null
                                                ),
                                                    0)              as calculated_tcv,
                                                d.deal_probability,
                                                case
                                                    when deal_probability > 0
                                                         and deal_probability < 100 then
                                                        'Yes'
                                                    else
                                                        'No'
                                                end                 open,
                                                deal_close_date,
                                                case
                                                    when deal_close_date < sysdate
                                                         and deal_probability != 0
                                                         and deal_probability != 100 then
                                                        'Yes'
                                                    else
                                                        'No'
                                                end                 past_due,
                                                d.qtr,
                                                (
                                                    select
                                                        max(dp.qtr)
                                                    from
                                                        eba_sales_deal_products dp
                                                    where
                                                        dp.deal_id = d.id
                                                )                   as calculated_qtr,
                                                dsc.status_code,
                                                d.tags,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_links
                                                    where
                                                        deal_id = d.id
                                                )                   links,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_files
                                                    where
                                                        deal_id = d.id
                                                )                   attachments,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_comments
                                                    where
                                                        deal_id = d.id
                                                )                   comments,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_verifications
                                                    where
                                                        opp_id = d.id
                                                )                   validations,
                                                (
                                                    select
                                                        max(created)
                                                    from
                                                        eba_sales_verifications
                                                    where
                                                        opp_id = d.id
                                                )                   last_validation,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_clicks
                                                    where
                                                            opp_id = d.id
                                                        and view_timestamp >= sysdate - 90
                                                )                   views_90_days,
                                                (
                                                    select
                                                        count(distinct(app_username))
                                                    from
                                                        eba_sales_clicks
                                                    where
                                                            opp_id = d.id
                                                        and view_timestamp >= sysdate - 90
                                                )                   users_90_days,
                                                d.updated,
                                                d.updated_by,
                                                d.created,
                                                d.created_by,
                                                sr.rep_first_name
                                                || ' '
                                                || sr.rep_last_name as sales_rep_name
                                            from
                                                     eba_sales_deals d
                                                join eba_sales_customers         c on c.id = d.customer_id
                                                left join eba_sales_deal_status_codes dsc on dsc.id = d.deal_status_code_id
                                                left join eba_sales_territories       t on t.id = c.customer_territory_id
                                                left join eba_sales_salesreps         sr on sr.id = d.salesrep_id_01
                          where
                              ( upper(c.default_rep_id) in (
                                  select
                                      upper(r.id)
                                  from
                                      eba_sales_salesreps r
                                  start with
                                      r.id = p_user_id
                                  connect by
                                      prior r.id = r.rep_manager_id
                              )
                                or exists (
                                  select
                                      'Y'
                                  from
                                      eba_sales_salesreps      r,
                                      eba_sales_salesrep_roles sr
                                  where
                                          r.id = p_user_id
                                      and sr.id = r.rep_role
                                      and sr.role_name = 'Administrator'
                              ) );

        apex_json.open_object;
        apex_json.write('get_opportunities', l_cursor);
        apex_json.close_object;
    end get_opportunities_venturi;


 -------GET OPPORTUNITIES(NEW UPDATED)--------- 

    procedure get_search_opportunities (
        p_user_id   varchar2,
        p_deal_name varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                'XXX' || d.id       id,
                                                d.row_key,
                                                d.deal_name,
                                                'XXX' || t.id       territory_id,
                                                t.territory_name,
                                                'XXX' || c.id       account_id,
                                                c.customer_name     account,
                                                d.deal_amount,
                                                nvl((
                                                    select
                                                        sum(nvl(dp.quote_price, 0))
                                                    from
                                                        eba_sales_deal_products dp
                                                    where
                                                            dp.deal_id = d.id
                                                        and dp.term is not null
                                                ),
                                                    0)              as calculated_amount,
                                                nvl((
                                                    select
                                                        sum(nvl(dp.quote_price, 0))
                                                    from
                                                        eba_sales_deal_products dp
                                                    where
                                                            dp.deal_id = d.id
                                                        and dp.term is null
                                                ),
                                                    0)              as calculated_opp,
                                                nvl((
                                                    select
                                                        sum(nvl(dp.tcv, 0))
                                                    from
                                                        eba_sales_deal_products dp
                                                    where
                                                            dp.deal_id = d.id
                                                        and dp.term is not null
                                                ),
                                                    0)              as calculated_tcv,
                                                d.deal_probability,
                                                case
                                                    when deal_probability > 0
                                                         and deal_probability < 100 then
                                                        'Yes'
                                                    else
                                                        'No'
                                                end                 open,
                                                deal_close_date,
                                                case
                                                    when deal_close_date < sysdate
                                                         and deal_probability != 0
                                                         and deal_probability != 100 then
                                                        'Yes'
                                                    else
                                                        'No'
                                                end                 past_due,
                                                d.qtr,
                                                (
                                                    select
                                                        max(dp.qtr)
                                                    from
                                                        eba_sales_deal_products dp
                                                    where
                                                        dp.deal_id = d.id
                                                )                   as calculated_qtr,
                                                dsc.status_code,
                                                d.tags,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_links
                                                    where
                                                        deal_id = d.id
                                                )                   links,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_files
                                                    where
                                                        deal_id = d.id
                                                )                   attachments,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_comments
                                                    where
                                                        deal_id = d.id
                                                )                   comments,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_verifications
                                                    where
                                                        opp_id = d.id
                                                )                   validations,
                                                (
                                                    select
                                                        max(created)
                                                    from
                                                        eba_sales_verifications
                                                    where
                                                        opp_id = d.id
                                                )                   last_validation,
                                                (
                                                    select
                                                        count(*)
                                                    from
                                                        eba_sales_clicks
                                                    where
                                                            opp_id = d.id
                                                        and view_timestamp >= sysdate - 90
                                                )                   views_90_days,
                                                (
                                                    select
                                                        count(distinct(app_username))
                                                    from
                                                        eba_sales_clicks
                                                    where
                                                            opp_id = d.id
                                                        and view_timestamp >= sysdate - 90
                                                )                   users_90_days,
                                                d.updated,
                                                d.updated_by,
                                                d.created,
                                                d.created_by,
                                                sr.rep_first_name
                                                || ' '
                                                || sr.rep_last_name as sales_rep_name
                                            from
                                                     eba_sales_deals d
                                                join eba_sales_customers         c on c.id = d.customer_id
                                                left join eba_sales_deal_status_codes dsc on dsc.id = d.deal_status_code_id
                                                left join eba_sales_territories       t on t.id = c.customer_territory_id
                                                left join eba_sales_salesreps         sr on sr.id = d.salesrep_id_01
                          where
                              ( upper(d.deal_name) like '%' || upper(p_deal_name || '%')
                                or upper(c.customer_name) like '%' || upper(p_deal_name || '%') )
                              and ( upper(c.default_rep_id) in (
                                  select
                                      upper(r.id)
                                  from
                                      eba_sales_salesreps r
                                  start with
                                      r.id = p_user_id
                                  connect by
                                      prior r.id = r.rep_manager_id
                              )
                                    or exists (
                                  select
                                      'Y'
                                  from
                                      eba_sales_salesreps      r,
                                      eba_sales_salesrep_roles sr
                                  where
                                          r.id = p_user_id
                                      and sr.id = r.rep_role
                                      and sr.role_name = 'Administrator'
                              ) );

        apex_json.open_object;
        apex_json.write('get_opportunities', l_cursor);
        apex_json.close_object;
    end get_search_opportunities;


     -----------------------------------------------------------------------------
    --Get App version
    -----------------------------------------------------------------------------
    procedure get_app_version (
        platform in varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        if platform = 'Android' then
            open l_cursor for 
    --SELECT PREFERENCE_VALUE AS VERSION FROM EBA_SALES_PREFERENCES WHERE PREFERENCE_NAME = 'MOBILE_APP_ANDROID';
             select
                                                    num_value as version
                                                from
                                                    xxeba_sales_parameters_t
                              where
                                  code = 'MOBILE_APP_ANDROID';

        elsif platform = 'iOS' then
            open l_cursor for 
    --SELECT PREFERENCE_VALUE AS VERSION FROM EBA_SALES_PREFERENCES WHERE PREFERENCE_NAME = 'MOBILE_APP_IOS';
             select
                                                    num_value as version
                                                from
                                                    xxeba_sales_parameters_t
                              where
                                  code = 'MOBILE_APP_IOS';

        end if;

        apex_json.open_object;
        apex_json.write('Platform', l_cursor);
        apex_json.close_object;
    end;
    -----------------------------------------------------------------------------
    --Get PRODUCT in Sale Order
    ---------------------------------------------------------------------------

    procedure get_saleorder_product (
        p_order_id in number
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                to_char(o.order_products_id) order_products_id,
                                                to_char(o.order_id)          order_id,
                                                o.product_name,
                                                o.product_price,
                                                o.currency_type,
                                                o.brand_id,
                                                o.quantity,
                                                o.delivery_date,
                                                p.catalogue_no
                                            from
                                                xxeba_order_products o,
                                                eba_sales_products   p
                          where
                                  o.product_id = p.id
                              and o.order_id = to_number(p_order_id);

        apex_json.open_object;
        apex_json.write('get_saleorder_product', l_cursor);
        apex_json.close_object;
    end;


    -----------------------------------------------------------------------------
    -- Update location for Accounts
    ---------------------------------------------------------------------------

    procedure update_acc_location (
        p_order_id  varchar2,
        p_latitude  varchar2,
        p_longitute varchar2
    ) as
        l_cursor       sys_refcursor;
        p_success_flag varchar2(100) := 'Success';
        p_num_rows     number := 0;
    begin
        update eba_sales_customers
        set
            last_updated_latitude = p_latitude,
            last_updated_longitude = p_longitute
        where
            id = to_number(p_order_id);

        p_num_rows := sql%rowcount;
        if p_num_rows = 0 then
            p_success_flag := 'Failed';
        end if;
        commit;
        open l_cursor for select
                              p_success_flag pmo_ords_response
                          from
                              dual;

        dbms_output.put_line(p_num_rows);
        dbms_output.put_line(p_success_flag);
        dbms_output.put_line(p_order_id);
        dbms_output.put_line(p_latitude);
        dbms_output.put_line(p_longitute);
        apex_json.open_object;
        apex_json.write('update_acc_location', l_cursor);
        apex_json.close_object;
    end update_acc_location;
            
     --------------------------------------------------------------------------------------------------------------------------------------------------------

    function xxeba_product_amount (
        p_order_id in varchar2
    ) return varchar2 is
        over_all_amount varchar2(50);
    begin
        select
            sum(amount)
        into over_all_amount
        from
            (
                select
                    so.order_id,
                    so.deal_id,
                    ( p.product_price * p.quantity ) as amount
                from
                    xxeba_sales_order    so,
                    eba_sales_deals      sd,
                    eba_sales_customers  sc,
                    eba_sales_salesreps  sr,
                    xxeba_order_products p
                where
                        so.deal_id = sd.id
                    and so.customer_id = sc.id
                    and so.sales_rep = sr.id
                    and p.order_id = so.order_id
            )
        where
            order_id = p_order_id;

        return over_all_amount;
    exception
        when others then
            raise_application_error(-20001, 'An error was encountered - '
                                            || sqlcode
                                            || ' -ERROR- '
                                            || sqlerrm);
    end xxeba_product_amount;
        
    -----------------------------------------------------------------------------
    -- Reseting Password  - Created by Sowndaryameena on 28th Aug 18
    ---------------------------------------------------------------------------

    procedure reset_password (
        v_password  varchar2,
        v_rep_email varchar2
    ) as

        l_cursor         sys_refcursor;
        p_success_flag   varchar2(100) := 'Success';
        p_num_rows       number := 0;
        p_encrypted_pswd varchar2(10);
    begin
   
     --select XXEBS_SALES_SECURITY_PKG.get_password_hash_value(V_PASSWORD) into P_Encrypted_pswd from dual;
       
   
     /*   update  EBA_SALES_SALESREPS 
         SET PASSWORD=P_Encrypted_pswd
           where UPPER(REP_EMAIL)= UPPER(V_REP_EMAIL);*/

        update eba_sales_salesreps
        set
            mpin = v_password
        where
            upper(rep_email) = upper(v_rep_email);

        p_num_rows := sql%rowcount;
        if p_num_rows = 0 then
            p_success_flag := 'Failed';
        end if;
        commit;
        open l_cursor for select
                              p_success_flag pmo_ords_response
                          from
                              dual;

        apex_json.open_object;
        apex_json.write('reset_password', l_cursor);
        apex_json.close_object;
    end reset_password;
   
    -----------------------------------------------------------------------------
    -- Getting Current PIN  - Created by Sowndaryameena on 29th Aug 18
    ---------------------------------------------------------------------------

    procedure get_current_pin (
        v_rep_email varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        --OPEN l_cursor for SELECT MPIN FROM EBA_SALES_SALESREPS WHERE UPPER(REP_EMAIL) = UPPER('richard.d@4iapps.com');
        open l_cursor for select
                                                mpin
                                            from
                                                eba_sales_salesreps
                          where
                              upper(rep_email) = upper(v_rep_email);

        apex_json.open_object;
        apex_json.write('get_current_pin', l_cursor);
        apex_json.close_object;
    end get_current_pin;

    -----------------------------------------------------------------------------
    -- Getting Billing Location  -- Created by Sowndaryameena on 28th Jan 19 -- Mail reference=> Subject : "Billing location to be added"
    ---------------------------------------------------------------------------

    procedure get_bil_location_accountbase (
        p_customer_id number
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                customer_location_name billing_location,
                                                'XXX' || id            billing_location_id
                                            from
                                                eba_sales_customer_locations
                          where
                              customer_id = p_customer_id; 
        
        
       /* select T.TERRITORY_NAME, SR.REP_FIRST_NAME||' '||SR.REP_LAST_NAME Rep_name, 'XXX'||C.DEFAULT_REP_ID  DEFAULT_REP_ID,  'XXX'||C.CUSTOMER_TERRITORY_ID  CUSTOMER_TERRITORY_ID from EBA_SALES_CUSTOMERS C, EBA_SALES_TERRITORIES T, EBA_SALES_SALESREPS SR
        where C.CUSTOMER_TERRITORY_ID = T.ID
        and C.DEFAULT_REP_ID = SR.ID
        and C.ID = P_CUSTOMER_ID;*/
        apex_json.open_object;
        apex_json.write('get_bil_location_accountbase', l_cursor);
        apex_json.close_object;
    end get_bil_location_accountbase;
    
    
  --Added on July 22nd 2019 from precision
--------------------------------------------------------------------------------
     ---Getting Account List for Add Opportunity -- Created by Sowndaryameena on 16th May 19 
    --------------------------------------------------------------------------------

    procedure get_appointment_account_list (
        p_employee_id varchar2
    ) as
        source_id   number;
        source_name varchar2(100);
        l_cursor    sys_refcursor;
    begin
        open l_cursor for select
                                                'XXX' || c.id   customer_id,
                                                c.customer_name customer_name
                                            from
                                                eba_sales_customers c
                          where
                                  c.status = 'A'
                              and ( upper(c.default_rep_id) in (
                                  select
                                      upper(r.id)
                                  from
                                      eba_sales_salesreps r
                                  start with
                                      r.id = to_number(p_employee_id)
                                  connect by
                                      prior r.id = r.rep_manager_id
                              )
                                    or exists (
                                  select
                                      'Y'
                                  from
                                      eba_sales_salesreps      r,
                                      eba_sales_salesrep_roles sr
                                  where
                                          r.id = to_number(p_employee_id)
                                      and sr.id = r.rep_role
                                      and sr.role_name = 'Administrator'
                              ) )
                          order by
                              c.customer_name asc;

        apex_json.open_object;
        apex_json.write('get_appointment_account_list', l_cursor);
        apex_json.close_object;
    end get_appointment_account_list;

     --------------------------------------------------------------------------------
     ---Getting Default Reps List based on the Customer Id  -- Created by Sowndaryameena on 20th May 19 
    --------------------------------------------------------------------------------

    procedure get_account_based_default_rep (
        p_customer_id varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                'XXX' || s.id             default_rep_id,
                                                ( rep_first_name
                                                  || ' ' || rep_last_name ) default_rep
                                            from
                                                eba_sales_salesreps s,
                                                eba_sales_customers c
                          where
                                  s.status = 'Y'
                              and s.id = c.default_rep_id
                              and c.id = p_customer_id;

        apex_json.open_object;
        apex_json.write('get_account_based_default_rep', l_cursor);
        apex_json.close_object;
    end get_account_based_default_rep;


    --------------------------------------------------------------------------------
     ---Getting Contact Person for Appointment -- Created by Sowndaryameena on 16th May 19 
    --------------------------------------------------------------------------------

    procedure get_appointment_contact_person (
        p_customer varchar2
    ) as
        source_id   number;
        source_name varchar2(100);
        l_cursor    sys_refcursor;
    begin
        open l_cursor for select
                                                'XXX' || id  contact_id,
                                                contact_name contact_name
                                            from
                                                eba_sales_customer_contacts
                          where
                                  customer_id = to_number(p_customer)
                              and status = 'Y';

        apex_json.open_object;
        apex_json.write('get_appointment_contact_person', l_cursor);
        apex_json.close_object;
    end get_appointment_contact_person;
    
     --------------------------------------------------------------------------------
     ---Getting Source List for Add Opportunity -- Created by Sowndaryameena on 16th May 19 
    --------------------------------------------------------------------------------

    procedure get_appointment_location (
        p_customer_id varchar2
    ) as
        source_id   number;
        source_name varchar2(100);
        l_cursor    sys_refcursor;
    begin
        open l_cursor for select
                                                'XXX' || id            id,
                                                customer_location_name location_name
                                            from
                                                eba_sales_customer_locations
                          where
                              customer_id = to_number(p_customer_id);

        apex_json.open_object;
        apex_json.write('get_appointment_location', l_cursor);
        apex_json.close_object;
    end get_appointment_location;

 --------------------------------------------------------------------------------
     ---Getting Fixed Through List based on the Customer Id  -- Created by Sowndaryameena on 21th May 19 
    --------------------------------------------------------------------------------

    procedure get_fixed_through_list as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                              'XXX' || id lead_id,
                              lead_source lead_source
                          from
                              eba_sales_lead_sources;

        apex_json.open_object;
        apex_json.write('get_fixed_through_list', l_cursor);
        apex_json.close_object;
    end get_fixed_through_list;
    
    --------------------------------------------------------------------------------
     ---Add new Appointment  -- Created by Sowndaryameena on 22th May 19 
    --------------------------------------------------------------------------------

    procedure add_appointment (
        p_customer_id         varchar2,
        p_contact_person_id   varchar2,
        p_contact_location_id varchar2,
        p_appointment_type    varchar2,
        p_appointment_date    varchar2,
        p_appointment_purpose varchar2,
        p_comments            varchar2,
        p_salesrep_id         varchar2,
        p_created_by          varchar2
    ) as
        p_success_flag varchar2(240);
        l_ret          rowid;
    begin
        insert into xxeba_sales_crm_appointments (
            customer_id,
            contact_person_id,
            contact_location_id,
            appointment_type,
            appointment_date,
            appointment_purpose,
            comments,
            appointment_status,
            salesrep_id,
            created_by,
            updated_by,
            appointment_source,
            source_application
        ) values ( to_number(p_customer_id),
                   to_number(p_contact_person_id),
                   to_number(p_contact_location_id),
                   p_appointment_type,
                   to_timestamp(p_appointment_date, 'DD-Mon-YYYY HH12:MI AM'),
                   p_appointment_purpose,
                   p_comments,
                   'Scheduled',
                   to_number(p_salesrep_id),
                   p_created_by,
                   p_created_by,
                   'D',
                   'M' ) returning rowid into l_ret;

        if l_ret is null then
            dbms_output.put_line('L_ret is null');
            p_success_flag := 'Failed';
        else
            dbms_output.put_line('L_ret else');
            p_success_flag := 'Success';
        end if;

        apex_json.open_object;
        apex_json.write('add_appointment', p_success_flag);
        apex_json.close_object;
    end add_appointment;
    
    
    --------------------------------------------------------------------------------
    -- UPDATE OPPORTUNITY STATUS FOR Cancel and Visited  -- Created by Sowndaryameena on 23th May 2019 
    --------------------------------------------------------------------------------    
    procedure update_appointment_status (
        p_appointment_status varchar2,
        p_comments           varchar2,
        p_visited_on         varchar2,
        p_negotiation_id     number,
        p_updated_by         varchar2,
        p_reason             varchar2,
        p_appt_id            varchar2,
        p_latitude           varchar2,
        p_longitude          varchar2
    ) is
        p_success_flag varchar2(100) := 'Success';
        l_cursor       sys_refcursor;
    begin
        if trim(p_appointment_status) = 'Cancelled' then
            update xxeba_sales_crm_appointments
            set
                appointment_status = p_appointment_status,
                comments = p_comments,
                updated_by = p_updated_by,
                updated = sysdate,
                status_comments = p_reason,
                appointment_source = 'D',
                source_application = 'M'
            where
                appt_id = to_number(p_appt_id);

        elsif trim(p_appointment_status) = 'Visited' then
            update xxeba_sales_crm_appointments
            set
                appointment_status = p_appointment_status,
                comments = p_comments,
                visited_on = p_visited_on,
                negotiation_id = p_negotiation_id,
                updated_by = p_updated_by,
                updated = sysdate,
                latitude = p_latitude,
                longitude = p_longitude,
                status_comments = p_reason,
                appointment_source = 'D',
                source_application = 'M'
            where
                appt_id = to_number(p_appt_id);

            dbms_output.put_line('Visited');
        end if;

        commit;
        open l_cursor for select
                              p_success_flag opportunity_status
                          from
                              dual;

        apex_json.open_object;
        apex_json.write('update_appointment_status', l_cursor);
        apex_json.close_object;
    end update_appointment_status;                                       
             
           
                   
             
             
    --------------------------------------------------------------------------------
    --- Edit Appointment  -- Created by Sowndaryameena on 23th May 2019 
    --------------------------------------------------------------------------------

    procedure edit_appointment_status (
        p_appt_id             varchar2,
        p_contact_person_id   varchar2,
        p_contact_location_id varchar2,
        p_appointment_type    varchar2,
        p_appointment_date    varchar2,
        p_appointment_purpose varchar2,
        p_comments            varchar2,
        p_reason              varchar2,
        p_appointment_status  varchar2,
        p_updated_by          varchar2
    ) as
        p_success_flag varchar2(100) := 'Success';
        l_ret          rowid;
        l_cursor       sys_refcursor;
    begin
        update xxeba_sales_crm_appointments
        set
            contact_person_id = to_number(p_contact_person_id),
            contact_location_id = to_number(p_contact_location_id),
            comments = p_reason,
            appointment_purpose = p_appointment_purpose,
            appointment_status = p_appointment_status,
            status_comments = p_comments,
            appointment_date = to_timestamp(p_appointment_date, 'DD-Mon-YYYY HH12:MI AM'),
                                           --   APPOINTMENT_DATE = TO_TIMESTAMP(P_APPOINTMENT_DATE, 'DD-MON-RR HH:MI:SS.FF AM'),
            appointment_type = p_appointment_type,
            updated_by = p_updated_by,
            updated = sysdate
        where
            appt_id = to_number(p_appt_id);

        commit;
        open l_cursor for select
                              p_success_flag edit_opportunity_status
                          from
                              dual;

        apex_json.open_object;
        apex_json.write('edit_appointment_status', p_success_flag);
        apex_json.close_object;
    end edit_appointment_status;
    
    
  ------------------------------------------------------------------------------------------------------------------------------
  ---Getting ORDER TYPE List for SALE ORDER  -- Created by Sowndaryameena on 1st Aug 2019 --------------------------------------
  ------------------------------------------------------------------------------------------------------------------------------

    procedure get_so_order_type as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                list_id    order_type_id,
                                                list_value order_type_value
                                            from
                                                xxeba_list_values
                          where
                              list_code = 'SALES_ORDER_TYPE'
                          order by
                              display_sequence;

        apex_json.open_object;
        apex_json.write('get_so_order_type', l_cursor);
        apex_json.close_object;
    end get_so_order_type;
    
    
     ------------------------------------------------------------------------------------------------------------------------------
     ---Getting NEGOTIATION for ATTENDANCE  -- Created by Sowndaryameena on 27 Aug 2019 ------------------------------------------
     ------------------------------------------------------------------------------------------------------------------------------ 

    procedure get_negotiation_list as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                list_id    negotiation_id,
                                                list_value negotiation_value
                                            from
                                                xxeba_list_values
                          where
                              list_code = 'ORDER_NEGOTIATION'
                          order by
                              display_sequence;

        apex_json.open_object;
        apex_json.write('get_negotiation_list', l_cursor);
        apex_json.close_object;
    end get_negotiation_list;

--------------------------------------------------------------------------------
    -- Adding ATTENDANCE IN TIME   -- Created by Sowndaryameena on 27th Aug 2019 
    --------------------------------------------------------------------------------

    procedure add_attendance (
        p_employee_id    varchar2,
        p_employee_name  varchar2,
        p_attend_in_lat  varchar2,
        p_attend_in_long varchar2,
        p_address        varchar2,
                                  -- P_CLIENT_IP_ADDRESS VARCHAR2,
        p_device_id      varchar2,
        p_created_by     varchar2
    ) as
	-- l_cursor SYS_REFCURSOR;
        p_success_flag varchar2(240);
        l_ret          rowid;
        p_att_id       number;
     --P_ATTENDANCE_FLAG VARCHAR2(1);
    begin
        insert into xxeba_sales_attendance_t (
            employee_id,
            employee_name,
            attend_date,
            attend_intime,
            attend_in_lat,
            attend_in_long,
            attend_in_location,
                                          --  CLIENT_IP_ADDRESS,
            device_id,
            source_app,
            created_by,
            created_date,
            updated_by,
            updated_date
        ) values ( p_employee_id,
                   p_employee_name,
                   sysdate,
                   sysdate,
                   p_attend_in_lat,
                   p_attend_in_long,
                   p_address,
                                        --    P_CLIENT_IP_ADDRESS,
                   p_device_id,
                   'M',
                   p_created_by,
                   sysdate,
                   p_created_by,
                   sysdate ) returning att_id into p_att_id;

        if p_att_id is null then
            dbms_output.put_line('L_ret is null');
            p_success_flag := 'Failed';
        else
            dbms_output.put_line('L_ret else');
            p_success_flag := 'Success' || p_att_id;
        end if;

        apex_json.open_object;
        apex_json.write('add_attendance', p_success_flag);
        apex_json.close_object;
    end add_attendance;
    
    
   --------------------------------------------------------------------------------
    -- Updating ATTENDANCE OUT TIME   -- Created by Sowndaryameena on 27th Aug 2019 
    --------------------------------------------------------------------------------

    procedure edit_attendance (
        p_att_id          number,
        p_attend_out_lat  varchar2,
        p_attend_out_long varchar2,
        p_address         varchar2,
        p_updated_by      varchar2
    ) as
        l_cursor       sys_refcursor;
        p_success_flag varchar2(100) := 'Success';
        p_num_rows     number := 0;
    begin
        update xxeba_sales_attendance_t
        set
            attend_out_time = sysdate,
            attend_out_lat = p_attend_out_lat,
            attend_out_long = p_attend_out_long,
            attend_out_location = p_address,
           --  CLIENT_IP_ADDRESS = P_CLIENT_IP_ADDRESS,
           --  DEVICE_ID = P_DEVICE_ID,
            -- SOURCE_APP = 'M',
            updated_by = p_updated_by,
            updated_date = sysdate
        where
            att_id = p_att_id;

        p_num_rows := sql%rowcount;
        if p_num_rows = 0 then
            p_success_flag := 'Failed';
        end if;
        commit;
        open l_cursor for select
                              p_success_flag attendance_status
                          from
                              dual;

        apex_json.open_object;
        apex_json.write('edit_attendance', l_cursor);
        apex_json.close_object;
    end edit_attendance;

    
    --------------------------------------------------------------------------------
    -- Getting ATTENDANCE Details  -- Created by Sowndaryameena on 27th Aug 2019 
    --------------------------------------------------------------------------------

    procedure get_attendance_list (
        p_employee_id varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                att_id,
                                                'XXX' || employee_id               employee_id,
                                                employee_name,
                                                to_char(to_date(trunc(attend_date)),
                                                        'DD-Mon-RRRR')             as attend_date,
                                                to_char(attend_intime, 'HH:MI PM') as attend_intime,
                                                nvl(
                                                    to_char(attend_out_time, 'HH:MI PM'),
                                                    0
                                                )                                  attend_out_time,
                                                nvl(source_app, '-')               source_app,
                                                created_by,
                                                to_char(to_date(trunc(created_date)),
                                                        'DD-Mon-RRRR')             created_date,
                                                updated_by,
                                                to_char(to_date(trunc(updated_date)),
                                                        'DD-Mon-RRRR')             as updated_date,
                                                nvl(attend_in_lat, '-')            attend_in_lat,
                                                nvl(attend_in_long, '-')           attend_in_long,
                                                nvl(attend_out_lat, '-')           attend_out_lat,
                                                nvl(attend_out_long, '-')          attend_out_long,
                                                replace(
                                                    xxebs_sales_security_pkg.get_location_details(att_id, 'IN'),
                                                    ',,',
                                                    ','
                                                )                                  as attend_in_location,
                                                replace(
                                                    xxebs_sales_security_pkg.get_location_details(att_id, 'OUT'),
                                                    ',,',
                                                    ','
                                                )                                  as attend_out_location
                                            from
                                                xxeba_sales_attendance_t
                          where
                              employee_id = to_number(p_employee_id)
                          order by
                              att_id desc;

        apex_json.open_object;
        apex_json.write('get_attendance_list', l_cursor);
        apex_json.close_object;
    end get_attendance_list;
    
    
     --------------------------------------------------------------------------------
    -- Check attendance availability   -- Created by Sowndaryameena on 27th August 19 
    --------------------------------------------------------------------------------

    procedure check_attendance_status (
        p_employee_id varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                count(*) attendance_count
                                            from
                                                xxeba_sales_attendance_t
                          where
                                  trunc(attend_date) = trunc(sysdate)
                              and employee_id = to_number(p_employee_id);

                    /*    SELECT COUNT(*) FLAG_COUNT FROM XXEBA_SALES_ATTENDANCE_T WHERE trunc(ATTEND_DATE) = trunc(SYSDATE)  AND
                         EMPLOYEE_ID = 176662751021822404495677413848332913116*/
        apex_json.open_object;
        apex_json.write('check_attendance_status', l_cursor);
        apex_json.close_object;
    end check_attendance_status;
    
    
    
    
    
    
    --------------------------------------------------------------------------------
    -- Get all leave request list   -- Created by Sowndaryameena on 17th September 19 
    --------------------------------------------------------------------------------

    procedure get_appr_leave_request (
        p_user_id varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                l.leave_request_id,
                                                'XXX' || l.sales_rep_id                 as sales_rep_id,
                                                s.rep_first_name                        as employee_name,
                                                to_char(l.from_date, 'DD Mon YYYY')     as from_date,
                                                to_char(l.to_date, 'DD Mon YYYY')       as to_date,
                                                nvl(l.from_period, '-')                 from_period,
                                                nvl(l.to_period, '-')                   to_period,
                                                l.no_of_days,
                                                coalesce(l.contact_number, 0)           contact_number,
                                                nvl(l.contact_address, '-')             contact_address,
                                                l.leave_reason,
                                                decode(
                                                    trim(l.leave_status),
                                                    'S',
                                                    'Submitted',
                                                    'A',
                                                    'Approved',
                                                    'R',
                                                    'Rejected'
                                                )                                       leave_status,
                                                l.status,
                                                l.created_by,
                                                to_char(l.creation_date, 'DD Mon YYYY') as creation_date,
                                                l.updated_by,
                                                to_char(l.update_date, 'DD Mon YYYY')   as update_date,
                                                l.approved_by,
                                                l.approved_date,
                                                l.approver_comments,
                                                l.leave_type_id,
                                                (
                                                    select
                                                        list_value
                                                    from
                                                        xxeba_list_values
                                                    where
                                                        list_id = l.leave_type_id
                                                )                                       leave_type
                                            from
                                                xxeba_sales_leave_requests_t l,
                                                eba_sales_salesreps          s
                          where
                                  leave_status = 'S'
                              and l.sales_rep_id = s.id
                              and s.rep_manager_id = to_number(p_user_id);

        apex_json.open_object;
        apex_json.write('get_appr_leave_request', l_cursor);
        apex_json.close_object;
    end get_appr_leave_request;
   
   

   
    --------------------------------------------------------------------------------
    -- Get all approval permission request list   -- Created by Sowndaryameena on 17th September 19 
    --------------------------------------------------------------------------------

    procedure get_appr_permission_request (
        p_user_id varchar2
    ) as
        l_cursor sys_refcursor;
    begin
        open l_cursor for select
                                                p.request_id,
                                                'XXX' || p.sales_rep_id                   as sales_rep_id,
                                                s.rep_first_name                          as employee_name,
                                                to_char(p.permission_date, 'DD Mon YYYY') as permission_date,
                                                p.from_time                               as from_time,
                                                p.to_time                                 as to_time,
                                                p.total_hours,
                                                p.permission_reason,
                                                decode(
                                                    trim(p.permission_status),
                                                    'S',
                                                    'Submitted',
                                                    'A',
                                                    'Approved',
                                                    'R',
                                                    'Rejected'
                                                )                                         as permission_status,
                                                p.status,
                                                p.created_by,
                                                to_char(p.creation_date, 'DD Mon YYYY')   as creation_date,
                                                p.updated_by,
                                                to_char(p.update_date, 'DD Mon YYYY')     as update_date,
                                                p.approved_by,
                                                p.approved_date,
                                                p.approver_comments
                                            from
                                                xxeba_sales_permissions_t p,
                                                eba_sales_salesreps       s
                          where
                                  permission_status = 'S'
                              and p.sales_rep_id = s.id
                              and s.rep_manager_id = p_user_id;

        apex_json.open_object;
        apex_json.write('get_appr_permission_request', l_cursor);
        apex_json.close_object;
    end get_appr_permission_request; 
    
    --------------------------------------------------------------------------------
    -- Update the leave status  -- Created by Sowndaryameena on 17th September 19 
    --------------------------------------------------------------------------------

    procedure update_leave (
        p_user_id           varchar2,
        p_status            varchar2,
        p_approver_comments varchar2,
        p_leave_request_id  number
    ) as

        l_cursor       sys_refcursor;
        p_success_flag varchar2(100) := 'Success';
        p_num_rows     number := 0;
        l_id           number;
    begin
        update xxeba_sales_leave_requests_t
        set
            approved_by = p_user_id,
            leave_status = p_status,
            approver_comments = p_approver_comments,
            approved_date = sysdate
        where
            leave_request_id = p_leave_request_id;

        open l_cursor for select
                             p_success_flag pmo_ords_response
                         from
                             dual;

        apex_json.open_object;
        apex_json.write('update_leave', l_cursor);
        apex_json.close_object;
    end update_leave;
    
    --------------------------------------------------------------------------------
    -- Update the permission status  -- Created by Sowndaryameena on 17th September 19 
    --------------------------------------------------------------------------------

    procedure update_permission (
        p_user_id           varchar2,
        p_status            varchar2,
        p_approver_comments varchar2,
        p_permission_id     number
    ) as

        l_cursor       sys_refcursor;
        p_success_flag varchar2(100) := 'Success';
        p_num_rows     number := 0;
        l_id           number;
    begin
        update xxeba_sales_permissions_t
        set
            approved_by = p_user_id,
            permission_status = p_status,
            approver_comments = p_approver_comments,
            approved_date = sysdate
        where
            request_id = p_permission_id;

        open l_cursor for select
                             p_success_flag pmo_ords_response
                         from
                             dual;

        apex_json.open_object;
        apex_json.write('update_permission', l_cursor);
        apex_json.close_object;
    end update_permission;
     
     -----------------------------------------------------------------------------
    --Insert device -- Created by Sowndaryameena on 12th December 19 
    -----------------------------------------------------------------------------

    procedure insert_device_list (
        emp_id    in varchar2,
        dev_id    in varchar2,
        reg_token in varchar2,
        platform  in varchar2,
        emp_code  in varchar2
    ) as

        l_cursor       sys_refcursor;
        p_success_flag varchar2(240);
        l_count        number;
        l_reg_token    varchar2(240) := reg_token;
    begin
        begin
            select
                count(reg_token)
            into l_count
            from
                xxfs_pm_mob_manage_dev_list
            where
                reg_token = l_reg_token;

            if l_count = 0 then
                insert into xxfs_pm_mob_manage_dev_list (
                    employee_id,
                    device_id,
                    reg_token,
                    platform,
                    push_status,
                    created_by,
                    updated_by
                ) values ( emp_id,
                           dev_id,
                           reg_token,
                           platform,
                           'Y',
                           emp_code,
                           emp_code );

                commit;
        /* ELSE
         UPDATE XXFS_PM_MOB_MANAGE_DEV_LIST SET EMPLOYEE_ID = EMP_ID,
                                                 DEVICE_ID = DEV_ID,
                                                 REG_TOKEN = REG_TOKEN,
                                                 PLATFORM= PLATFORM, 
                                                 PUSH_STATUS='Y',
                                                 CREATED_BY=EMP_CODE,
                                                 UPDATED_BY=EMP_CODE WHERE REG_TOKEN = l_reg_token; */
         
        --  INSERT INTO XXFS_PM_MOB_MANAGE_DEV_LIST (EMPLOYEE_ID,DEVICE_ID,REG_TOKEN,PLATFORM,PUSH_STATUS,CREATED_BY,UPDATED_BY)
        -- VALUES (EMP_ID,DEV_ID,REG_TOKEN,PLATFORM,'Y',EMP_CODE,EMP_CODE);         
            end if;

            p_success_flag := 'Success';
        exception
            when others then
                p_success_flag := 'Failed';
        end;

        open l_cursor for select
                             p_success_flag status
                         from
                             dual;

        apex_json.open_object;
        apex_json.write('status', l_cursor);
        apex_json.close_object;
    end;

end xxeba_crm_acc_mobile_pkg;
/


-- sqlcl_snapshot {"hash":"0c5d491534c1d1c6a53566623f6cddfdee336b91","type":"PACKAGE_BODY","name":"XXEBA_CRM_ACC_MOBILE_PKG","schemaName":"XXVENTURI","sxml":""}