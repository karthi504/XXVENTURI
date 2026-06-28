create or replace package xxventuri.xxeba_crm_acc_mobile_pkg as

  /************************************************************************************************************************************************************ 
      Name            :    XXEBA_CRM_ACC_MOBILE_PKG 
      Purpose         :    For maintaining the complete (Msk VenturiTools)CRM modules in mobile apps.
      Version History :    1.2 (Push Notification)

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
    );

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
    );

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
    );

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
    );

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
    );

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
    );

    procedure get_territory;

    procedure get_industry;

    procedure get_account_default_rep;

    procedure get_account_lov (
        app_user_id number,
        app_user    varchar2
    );

    procedure get_classification;

    procedure get_acc_source;

    procedure get_accounts (
        app_user     varchar2,
        app_user_id  number,
        territory_id number,
        p_cust_name  varchar2
    );

    procedure get_contacts (
        app_user_id number,
        app_user    varchar2
    );

    procedure get_salesorderlist (
        app_user_id number
    );

    procedure get_salesorder_accountlist (
        app_user_id number
    );

    procedure get_orderinfo_accountbase (
        p_customer_id number
    );

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
    );

    procedure get_product_list (
        p_search_prod varchar2
    );

    procedure get_productinfo (
        p_product_id number
    );

    procedure get_brand_list;

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
    );

    procedure get_pricelist;

    procedure get_search_pricelist (
        p_product_name varchar2
    );

    procedure get_appointments_list (
        p_user_id varchar2
    );

    procedure get_search_appointments (
        p_user_id       varchar2,
        p_customer_name varchar2
    );

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
    );

    procedure get_search_salesorderlist (
        app_user_id     number,
        p_customer_name varchar2
    );

    procedure get_products (
        p_order_id varchar2
    );

    procedure edit_salesorder_product (
        p_order_products_id varchar2,
        p_product_price     number,
        p_quantity          number,
        p_delivery_date     varchar2,
        p_updated_by        varchar2
    );

    procedure delete_salesorder_product (
        p_order_products_id varchar2
    );

    procedure get_accounts_venturi (
        p_user_id varchar2
    );

    procedure get_search_accounts (
        p_user_id       varchar2,
        p_customer_name varchar2
    );

    procedure get_contacts_venturi (
        p_user_id varchar2
    );

    procedure get_search_contacts (
        p_user_id      varchar2,
        p_contact_name varchar2
    );

    procedure get_opportunities_venturi (
        p_user_id varchar2
    );

    procedure get_search_opportunities (
        p_user_id   varchar2,
        p_deal_name varchar2
    );

    procedure get_app_version (
        platform in varchar2
    );

    procedure get_saleorder_product (
        p_order_id in number
    );

    procedure update_acc_location (
        p_order_id  varchar2,
        p_latitude  varchar2,
        p_longitute varchar2
    );

    function xxeba_product_amount (
        p_order_id in varchar2
    ) return varchar2;

    procedure reset_password (
        v_password  varchar2,
        v_rep_email varchar2
    );

    procedure get_current_pin (
        v_rep_email varchar2
    );

    procedure get_bil_location_accountbase (
        p_customer_id number
    );

    procedure get_appointment_account_list (
        p_employee_id varchar2
    );

    procedure get_account_based_default_rep (
        p_customer_id varchar2
    );

    procedure get_appointment_contact_person (
        p_customer varchar2
    );

    procedure get_appointment_location (
        p_customer_id varchar2
    );

    procedure get_fixed_through_list;

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
    );

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
    );

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
    );

    procedure get_so_order_type;

    procedure get_negotiation_list;

    procedure add_attendance (
        p_employee_id    varchar2,
        p_employee_name  varchar2,
        p_attend_in_lat  varchar2,
        p_attend_in_long varchar2,
        p_address        varchar2,
                                --   P_CLIENT_IP_ADDRESS VARCHAR2,
        p_device_id      varchar2,
        p_created_by     varchar2
    );

    procedure edit_attendance (
        p_att_id          number,
        p_attend_out_lat  varchar2,
        p_attend_out_long varchar2,
        p_address         varchar2,
        p_updated_by      varchar2
    );

    procedure get_attendance_list (
        p_employee_id varchar2
    );

    procedure check_attendance_status (
        p_employee_id varchar2
    );

    procedure get_appr_leave_request (
        p_user_id varchar2
    );

    procedure get_appr_permission_request (
        p_user_id varchar2
    );

    procedure update_leave (
        p_user_id           varchar2,
        p_status            varchar2,
        p_approver_comments varchar2,
        p_leave_request_id  number
    );

    procedure update_permission (
        p_user_id           varchar2,
        p_status            varchar2,
        p_approver_comments varchar2,
        p_permission_id     number
    );

    procedure insert_device_list (
        emp_id    in varchar2,
        dev_id    in varchar2,
        reg_token in varchar2,
        platform  in varchar2,
        emp_code  in varchar2
    );

end xxeba_crm_acc_mobile_pkg;
/


-- sqlcl_snapshot {"hash":"6849292695023ebca0d0a8a9a207627ffcb4dcea","type":"PACKAGE_SPEC","name":"XXEBA_CRM_ACC_MOBILE_PKG","schemaName":"XXVENTURI","sxml":""}