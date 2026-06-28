create or replace function xxventuri.xxeba_send_mail (
    p_from      in varchar2,
    p_to        in varchar2,
    p_cc        in varchar2,
    p_bcc       in varchar2,
    p_subject   in varchar2,
    p_body      in varchar2,
    p_html_body in varchar2 
---   p_attachment   IN email_attachments 
) return number is 
 
---   C_PF_NAME         pkg_log.identifier:='xxfs_pm_send_mail'; 
    v_mail_id      number;
    v_workspace_id integer;
    cursor aaw_cur is
    select
        max(workspace_id)
    from
        apex_applications
    where
        workspace = 'VENTURITOOL';

begin 

-- Below code is to make apex_mail to work in all session.  

    begin
        v_mail_id := apex_mail.send(
            p_to        => p_to,
            p_from      => p_from,
            p_bcc       => p_bcc,
            p_cc        => p_cc,
            p_body      => nvl(p_body, '  '),
            p_body_html => p_html_body,
            p_subj      => p_subject
        );      

/* 
      FOR i IN 1..p_attachment.count  LOOP 

         apex_mail.add_attachment(p_mail_id => v_mail_id, 
            p_attachment => p_attachment(i).content , 
            p_filename => p_attachment(i).file_name||'.'||p_attachment(i).file_type, 
            p_mime_type => p_attachment(i).mime_type); 

      END LOOP; 
**/ 

---     apex_mail.push_queue; 

        apex_mail.push_queue(
            p_smtp_hostname => '4iapps-com.mail.protection.outlook.com',
            p_smtp_portno   => 25
        );
        return 1;
    exception
        when others then
            if sqlerrm = 'ORA-20001: This procedure must be invoked from within an application session.' then
                begin
                    open aaw_cur;
                    fetch aaw_cur into v_workspace_id;
                    close aaw_cur; 

               /*IF v_workspace_id IS NULL THEN  
                  RAISE_APPLICATION_ERROR(-20100, 'Workspace-ID is Null. It is required'); 

               END IF;*/

                    wwv_flow_api.set_security_group_id(v_workspace_id);
                    v_mail_id := apex_mail.send(
                        p_to        => p_to,
                        p_from      => p_from,
                        p_bcc       => p_bcc,
                        p_cc        => p_cc,
                        p_body      => nvl(p_body, '  '),
                        p_body_html => p_html_body,
                        p_subj      => p_subject
                    ); 

/* 
               FOR i IN 1..p_attachment.count  LOOP 
                  apex_mail.add_attachment(p_mail_id => v_mail_id, 
                     p_attachment => p_attachment(i).content , 
                     p_filename => p_attachment(i).file_name||'.'||p_attachment(i).file_type, 
                     p_mime_type => p_attachment(i).mime_type); 
               END LOOP; 
*/
                    apex_mail.push_queue; 

         ---     apex_mail.push_queue(P_SMTP_HOSTNAME => '4iapps-com.mail.protection.outlook.com', P_SMTP_PORTNO => 25);  

                    return 1;
                exception
                    when others then 

/*                  pkg_log.log_error(C_PACKAGE_NAME, C_PF_NAME, SQLCODE, SQLERRM, dbms_utility.format_error_backtrace, 
                     'Error in apex send mail after workspace id setting from:='||p_from||', to:='||p_to||', bcc:='||p_bcc||', cc:='||p_cc|| 
                     ', subject:='||p_subject); 
*/
                        return 0;
                end;

            else 

/*            pkg_log.log_error(C_PACKAGE_NAME, C_PF_NAME, SQLCODE, SQLERRM, dbms_utility.format_error_backtrace, 
               'Error in apex send mail other than workspace id setting from:='||p_from||', to:='||p_to||', bcc:='||p_bcc||', cc:='||p_cc|| 
               ', subject:='||p_subject); 
*/
                return 0;
            end if;
    end;
exception
    when others then  

/*      pkg_log.log_error(C_PACKAGE_NAME, C_PF_NAME, SQLCODE, SQLERRM, dbms_utility.format_error_backtrace, 
         'from:='||p_from||', to:='||p_to||', bcc:='||p_bcc||', cc:='||p_cc|| 
         ', subject:='||p_subject); 
*/
        return 0;
end xxeba_send_mail;
/


-- sqlcl_snapshot {"hash":"7749ce50ee785297794ebd0df2e702484d076989","type":"FUNCTION","name":"XXEBA_SEND_MAIL","schemaName":"XXVENTURI","sxml":""}