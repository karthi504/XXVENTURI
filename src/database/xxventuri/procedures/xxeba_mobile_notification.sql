create or replace procedure xxventuri.xxeba_mobile_notification (
    p_user_id number
) as
    v_reg_token      varchar2(250);
    lv_rep_mgr_email varchar2(100);
    lv_rep_mgr_id    number;
    l_clob           clob;
begin
    apex_web_service.g_request_headers(1).name := 'Content-Type';
    apex_web_service.g_request_headers(1).value := 'application/json';
    apex_web_service.g_request_headers(2).name := 'authorization';
    apex_web_service.g_request_headers(2).value := 'key=AAAAGTxwp2I:APA91bGXJwWkhD4dXY0bMr4U8BahbBpVyY6he9Qhla-MlDSyioQ00rQNqme37h6-4sxmZwcY5gJUD-pJceKiw3CegoRloQ2hdBfSeQOQqD4RdQSnGQAyA15_KlWuKt5lJvOUx0VPotu5'
    ;
    begin
        select
            rep_email
        into lv_rep_mgr_email
        from
            eba_sales_salesreps
        where
            id = (
                select
                    rep_manager_id
                from
                    eba_sales_salesreps
                where
                    id = p_user_id
            );
 /* EXCEPTION
  WHEN OTHERS THEN
    lv_rep_mgr_email:= NULL;
    xxfs_pm_error_log_pkg.record_log( 'ERROR', 'Push Notification', 'Block 1', :APP_PAGE_ID );*/
    end;

    begin
        select
            rep_manager_id
        into lv_rep_mgr_id
        from
            eba_sales_salesreps
        where
            id = p_user_id;
  /*EXCEPTION
  WHEN OTHERS THEN
    lv_rep_mgr_email:= NULL;
    xxfs_pm_error_log_pkg.record_log( 'ERROR', 'Push Notification', 'Block 2', :APP_PAGE_ID );*/
    end;
    begin
        select
            reg_token
        into v_reg_token
        from
            xxfs_pm_mob_manage_dev_list
        where
            creation_date = (
                select
                    max(creation_date)
                from
                    xxfs_pm_mob_manage_dev_list
                where
                    trim(employee_id) = trim(lv_rep_mgr_email)
            );
      
/*EXCEPTION WHEN OTHERS THEN 
lv_rep_mgr_email:= NULL;
    xxfs_pm_error_log_pkg.record_log( 'ERROR', 'Push Notification', 'Block 4', :APP_PAGE_ID );*/
    end;

    l_clob := apex_web_service.make_rest_request(
        p_url         => 'https://fcm.googleapis.com/fcm/send',
        p_http_method => 'POST',
        p_parm_name   => apex_util.string_to_table('notification:to:v_reg_token'),
        p_parm_value  => apex_util.string_to_table('{"title": "Pending Leave Request": "5 to 1"}:"AAAAGTxwp2I:APA91bGXJwWkhD4dXY0bMr4U8BahbBpVyY6he9Qhla-MlDSyioQ00rQNqme37h6-4sxmZwcY5gJUD-pJceKiw3CegoRloQ2hdBfSeQOQqD4RdQSnGQAyA15_KlWuKt5lJvOUx0VPotu5":{"message":"Pending Leave request for your approval, kindly review and approve"}'
        ) -- Notification Content (3)
    );

    raise_application_error(-2001, 'Push Notification ' || l_clob);
end;
/


-- sqlcl_snapshot {"hash":"0eeb68b317cd002685e8133c53c21be3b3a5763f","type":"PROCEDURE","name":"XXEBA_MOBILE_NOTIFICATION","schemaName":"XXVENTURI","sxml":""}