create or replace package body xxventuri.xxebs_msk_sales_scheduler_pkg is

    procedure xxebs_new_account_mail as

        lv_v_director_email varchar2(100);
        lv_v_director_name  varchar2(200);
        lv_mail_response    number;
        lv_count            number;
        lv_v_body           clob;
        lv_v_table          clob;
        lv_v_body_html      clob;
        lv_v_crlf           varchar2(2) := chr(13)
                                 || chr(10);
    begin
        select
            rep_first_name,
            rep_email
        into
            lv_v_director_name,
            lv_v_director_email
        from
            eba_sales_salesreps      s,
            eba_sales_salesrep_roles r
        where
                s.rep_role = r.id
            and role_name = 'Administrator';

        select
            count(id)
        into lv_count
        from
            eba_sales_customers
        where
            to_char(created, 'DD-MON-YYYY') = to_char(sysdate - 1, 'DD-MON-YYYY');

        lv_v_body := 'To view the content of this message, please use an HTML enabled mail client.' || lv_v_crlf;
        lv_v_body_html := '<html><head>

           <style type="text/css">
                body{font-family: Tahoma, Arial, Helvetica, sans-serif;
                    font-size:10pt;
                    color:#002060;
                    margin:30px;
                    background-color:#ffffff;}
                span.sig{font-style:italic;
                    font-weight:bold;
                    color:#811919;}
             </style>'
                          || '</head><body> Hi,'
                          || '<br><br>Please find below the list of New Accounts created on'
                          || ' '
                          || to_char(sysdate - 1, 'DD-Mon-YYYY')
                          || ':'
                          || '<br/> <br/>'
                          || '<table  border="1" style="border-collapse:collapse"><tr> 
     <th style="border:1px solid; text-align:center; width: 50px;"> SNo. </th>   
    <th style="border:1px solid; text-align:left; width: 120px;"> Account Name </th>   
    <th style="border:1px solid; text-align:left; width: 120px;" >Description</th>    
    <th style="border:1px solid; text-align:left; width: 120px;" >Industry</th>   
    <th style="border:1px solid; text-align:left; width: 140px;" >Territory </th> 
     <th style="border:1px solid; text-align:left; width: 120px;" >Added By </th>
    <th style="border:1px solid; text-align:left; width: 120px;" >Status</th>
    </tr>';

        for rec in (
            select
                rownum,
                c.customer_name,
                c.customer_description,
                c.gst_no,
                i.industry_name,
                c.created,
                lower(c.created_by)                         created_by,
                t.id                                        territory_id,
                t.territory_name,
                nvl(v.verification_status, 'Not Validated') as status
            from
                eba_sales_customers     c,
                eba_sales_territories   t,
                eba_sales_verifications v,
                eba_sales_industries    i
            where
                    t.id = c.customer_territory_id
                and v.cust_id (+) = c.id
                and to_char(c.created, 'DD-MON-YYYY') = to_char(sysdate - 1, 'DD-MON-YYYY')
                and i.id = c.industry_id
        ) loop
            lv_v_table := '<tr>'
                          || '<td style="text-align:center;">'
                          || rec.rownum
                          || '<td>'
                          || rec.customer_name
                          || '</td>'
                          || '<td>'
                          || rec.customer_description
                          || '</td>'
                          || '<td>'
                          || rec.industry_name
                          || '</td>'
                          || '<td >'
                          || rec.territory_name
                          || '</td>'
                          || '<td>'
                          || rec.created_by
                          || '</td>'
                          || '<td>'
                          || rec.status
                          || '</td></tr>';

            lv_v_body_html := lv_v_body_html || lv_v_table;
        end loop;

        lv_v_body_html := lv_v_body_html
                          || '</table> <br> Regards,<br> '
                          || 'CRM Desk';
        if lv_count > 0 then
            lv_mail_response := apex_mail.send(
                p_to        => 'rajan@venturitool.com',
                p_bcc       => 'richard.d@4iapps.com,selvamani.d@4iapps.com',
                p_from      => 'CRM Desk "@" Venturi Tools <CRM_Desk@4iapps.com>',
                p_subj      => 'New Accounts Created on'
                          || ' '
                          || to_char(sysdate - 1, 'DD-Mon-YYYY'),
                p_body      => lv_v_body,
                p_body_html => lv_v_body_html
            );

            apex_mail.push_queue(
                p_smtp_hostname => '4iapps-com.mail.protection.outlook.com',
                p_smtp_portno   => 25
            );
        end if;

    exception
        when others then
            dbms_output.put_line(sqlerrm);
    end xxebs_new_account_mail;

    procedure xxeba_daily_trans_summary (
        app_id   in number,
        app_name in varchar2
    ) is

        lv_v_body                 clob;
        lv_v_body_html            clob;
        lv_v_body_html1           clob;
        lv_v_crlf                 varchar2(2) := chr(13)
                                 || chr(10);
        lv_mail_response          number;
        lv_new_acc_count          number;
        lv_modified_acc_count     number;
        lv_new_contact_count      number;
        lv_modified_contact_count number;
        lv_new_lead_count         number;
        lv_modified_lead_count    number;
        lv_new_opp_count          number;
        lv_modified_opp_count     number;
        lv_new_so_count           number;
        lv_modified_so_count      number;
        lv_new_com_count          number;
        lv_modified_com_count     number;
        lv_mail_subject           varchar2(200);
        lv_day                    varchar2(50);
        lv_trans_log_id           number;
        lv_user_log_id            number;
    begin
        select
            count(id)
        into lv_new_acc_count
        from
            eba_sales_customers
        where
            to_char(
                trunc(created),
                'DD-Mon-YYYY'
            ) = to_char(sysdate, 'DD-Mon-YYYY');

        select
            count(id)
        into lv_modified_acc_count
        from
            eba_sales_customers
        where
                to_char(
                    trunc(updated),
                    'DD-Mon-YYYY'
                ) = to_char(sysdate, 'DD-Mon-YYYY')
            and to_char(
                trunc(created),
                'DD-Mon-YYYY'
            ) <> to_char(sysdate, 'DD-Mon-YYYY');

        select
            count(id)
        into lv_new_contact_count
        from
            eba_sales_customer_contacts
        where
            to_char(
                trunc(created),
                'DD-Mon-YYYY'
            ) = to_char(sysdate, 'DD-Mon-YYYY');

        select
            count(id)
        into lv_modified_contact_count
        from
            eba_sales_customer_contacts
        where
                to_char(
                    trunc(updated),
                    'DD-Mon-YYYY'
                ) = to_char(sysdate, 'DD-Mon-YYYY')
            and to_char(
                trunc(created),
                'DD-Mon-YYYY'
            ) <> to_char(sysdate, 'DD-Mon-YYYY');

        select
            count(id)
        into lv_new_lead_count
        from
            eba_sales_leads
        where
            to_char(
                trunc(created),
                'DD-Mon-YYYY'
            ) = to_char(sysdate, 'DD-Mon-YYYY');

        select
            count(id)
        into lv_modified_lead_count
        from
            eba_sales_leads
        where
                to_char(
                    trunc(updated),
                    'DD-Mon-YYYY'
                ) = to_char(sysdate, 'DD-Mon-YYYY')
            and to_char(
                trunc(created),
                'DD-Mon-YYYY'
            ) <> to_char(sysdate, 'DD-Mon-YYYY');

        select
            count(id)
        into lv_new_opp_count
        from
            eba_sales_deals
        where
                to_char(
                    trunc(created),
                    'DD-Mon-YYYY'
                ) = to_char(sysdate, 'DD-Mon-YYYY')
            and source_type = 'D';

        select
            count(id)
        into lv_modified_opp_count
        from
            eba_sales_deals
        where
                to_char(
                    trunc(updated),
                    'DD-Mon-YYYY'
                ) = to_char(sysdate, 'DD-Mon-YYYY')
            and to_char(
                trunc(created),
                'DD-Mon-YYYY'
            ) <> to_char(sysdate, 'DD-Mon-YYYY')
            and source_type = 'D';

        select
            count(order_id)
        into lv_new_so_count
        from
            xxeba_sales_order
        where
                to_char(
                    trunc(created),
                    'DD-Mon-YYYY'
                ) = to_char(sysdate, 'DD-Mon-YYYY')
            and status = 'Y';

        select
            count(order_id)
        into lv_modified_so_count
        from
            xxeba_sales_order
        where
                to_char(
                    trunc(updated),
                    'DD-Mon-YYYY'
                ) = to_char(sysdate, 'DD-Mon-YYYY')
            and to_char(
                trunc(created),
                'DD-Mon-YYYY'
            ) <> to_char(sysdate, 'DD-Mon-YYYY');

        select
            count(complaint_id)
        into lv_new_com_count
        from
            xxeba_customer_complaints_t
        where
            to_char(
                trunc(created),
                'DD-Mon-YYYY'
            ) = to_char(sysdate, 'DD-Mon-YYYY');

        select
            count(complaint_id)
        into lv_modified_com_count
        from
            xxeba_customer_complaints_t
        where
                to_char(
                    trunc(updated),
                    'DD-Mon-YYYY'
                ) = to_char(sysdate, 'DD-Mon-YYYY')
            and to_char(
                trunc(created),
                'DD-Mon-YYYY'
            ) <> to_char(sysdate, 'DD-Mon-YYYY');

        select
            to_char(sysdate, 'Day')
        into lv_day
        from
            dual;

        select
            xxeba_transactions_log_seq.nextval
        into lv_trans_log_id
        from
            dual;

        select
            xxeba_users_log_seq.nextval
        into lv_user_log_id
        from
            dual;

        insert into xxeba_transactions_log_t (
            trans_log_id,
            accounts_new,
            accounts_updated,
            contacts_new,
            contacts_updated,
            leads_new,
            leads_updated,
            opportunities_new,
            opportunities_updated,
            sales_orders_new,
            sales_orders_updated,
            complaints_new,
            complaints_updated,
            created_date
        ) values ( lv_trans_log_id,
                   lv_new_acc_count,
                   lv_modified_acc_count,
                   lv_new_contact_count,
                   lv_modified_contact_count,
                   lv_new_lead_count,
                   lv_modified_lead_count,
                   lv_new_opp_count,
                   lv_modified_opp_count,
                   lv_new_so_count,
                   lv_modified_so_count,
                   lv_new_com_count,
                   lv_modified_com_count,
                   localtimestamp );

        commit;

			--if (lv_new_acc_count > 0 or lv_modified_acc_count > 0 or lv_new_contact_count > 0 or lv_modified_contact_count > 0 or lv_new_lead_count > 0 or
			--lv_modified_lead_count > 0 or  lv_new_opp_count > 0 or lv_modified_opp_count > 0 ) then
        lv_mail_subject := app_name
                           || ': Daily Transaction Summary ['
                           || to_char(sysdate, 'DD-Mon-YYYY')
                           || ']';

        lv_v_body := 'To view the content of this message, please use an HTML enabled mail client.' || lv_v_crlf;
        lv_v_body_html := '<html><head>                    
									<style type="text/css">                         
									body{font-family: Tahoma, Arial, Helvetica, sans-serif;                        
									font-size:10pt; 
									color:#002060; 
									margin:0px; 
									background-color:#ffffff;} 
									span.sig{font-style:italic; 
									font-weight:bold; 
									color:#811919;} 
							   </style>
							   </head><body>Dear Admin,'
                          || '<br/><br/>Please find below, the <b>Transactions Summary</b> of <b>'
                          || to_char(sysdate, 'DD-Mon-YYYY')
                          || ' ('
                          || trim(lv_day)
                          || ')</b>:'
                          || '<br/><br/>'
                          || '<table  border="1" style="border-collapse:collapse;font-size:10pt; 
									color:#002060; ">
			  <tr>
				<th style="border:1px solid;" align="left" width="125">Type</th>
				<th style="border:1px solid;" align="center" width="125">Newly Added</th> 
				 <th style="border:1px solid;" align="center" width="125">Updated</th>
			  </tr>
			  <tr>
				<td>Accounts</td>
				<td style="text-align:center";>'
                          || lv_new_acc_count
                          || '</td>
				 <td style="text-align:center";>'
                          || lv_modified_acc_count
                          || '</td> 
			  </tr>
				<td>Contacts</td>
				<td style="text-align:center";>'
                          || lv_new_contact_count
                          || '</td>
				 <td style="text-align:center";>'
                          || lv_modified_contact_count
                          || '</td>
			  </tr>
				<td>Leads</td>
				<td style="text-align:center";>'
                          || lv_new_lead_count
                          || '</td>
				<td style="text-align:center";>'
                          || lv_modified_lead_count
                          || '</td>
			  </tr>
			  <tr>
				<td>Opportunities</td>
				<td style="text-align:center";>'
                          || lv_new_opp_count
                          || '</td>
				 <td style="text-align:center";>'
                          || lv_modified_opp_count
                          || '</td>
			  </tr>
			  <tr>
				<td>Sales Orders</td>
				<td style="text-align:center";>'
                          || lv_new_so_count
                          || '</td>
				 <td style="text-align:center";>'
                          || lv_modified_so_count
                          || '</td>
			  </tr>
			   <tr>
				<td>Complaints</td>
				<td style="text-align:center";>'
                          || lv_new_com_count
                          || '</td>
				 <td style="text-align:center";>'
                          || lv_modified_com_count
                          || '</td>
			  </tr>
			  
			 </td></table> '; 
			 --xxfs_pm_error_log_pkg.record_log ('ERROR','daily_trans_summary',lv_v_body_html);
        lv_v_body := 'To view the content of this message, please use an HTML enabled mail client.' || lv_v_crlf;
        lv_v_body_html1 := '<html><head>                    
									<style type="text/css">                         
									body{font-family: Tahoma, Arial, Helvetica, sans-serif;                        
									font-size:10pt; 
									color:#002060; 
									margin:0px; 
									background-color:#ffffff;} 
									span.sig{font-style:italic; 
									font-weight:bold; 
									color:#811919;} 
							   </style>
							   </head><body>'
                           || '<br/><br/>User-wise Access Details:<br/><br/>'
                           || '<table border="1" style="border-collapse:collapse;font-size:10pt; 
									color:#002060; "><tr height="20"><strong>'
                           || '<td style="width:100px">Username</td>
							 <td style="width:150px">Transaction Date</td>
						 <td style="width:150px">First Login</td>
						 <td style="width:150px">Last Used</td>
						 </tr></strong>';
        for rec in (
            select
                apex_user,
                to_char(
                    trunc(view_date),
                    'DD-Mon-YYYY'
                ) as trans_date,
                to_char(
                    min(view_date),
                    'DD-Mon-YYYY HH:MI AM'
                ) as first_login,
                to_char(
                    max(view_date),
                    'DD-Mon-YYYY HH:MI AM'
                ) as last_used
            from
                (
                    select distinct
                        act.apex_session_id,
                        act.application_id,
                        act.application_name,
                        act.apex_user,
                        act.page_id,
                        act.page_name,
                        act.view_date,
                        act.rows_queried
                    from
                        apex_workspace_activity_log act,
                        apex_application_page_ir    pir
                    where
                            act.page_id = pir.page_id
                        and act.apex_user != 'nobody'
                        and act.application_name like '%CRM%'
                        and act.application_id = app_id
                        and lower(act.apex_user) != 'admin'
                    order by
                        act.view_date desc,
                        apex_session_id desc
                )
            where
                trunc(view_date) = trunc(sysdate)
            group by
                apex_user,
                trunc(view_date)
            order by
                apex_user
        ) loop
            insert into xxeba_users_log_t (
                users_log_id,
                username,
                transaction_date,
                first_login,
                last_used,
                created_date
            ) values ( lv_user_log_id,
                       rec.apex_user,
                       rec.trans_date,
                       to_timestamp(rec.first_login, 'DD-Mon-YYYY HH:MI AM'),
                       to_timestamp(rec.last_used, 'DD-Mon-YYYY HH:MI AM'),
                       localtimestamp );

            lv_v_body_html1 := lv_v_body_html1
                               || '<tr><td>'
                               || initcap(rec.apex_user)
                               || '</td><td>'
                               || rec.trans_date
                               || '</td><td>'
                               || rec.first_login
                               || '</td><td>'
                               || rec.last_used
                               || '</td></tr>';

            xxfs_pm_error_log_pkg.record_log('ERROR', 'daily_trans_summary', lv_v_body_html1);
        end loop;

        commit;
        lv_v_body_html := lv_v_body_html
                          || lv_v_body_html1
                          || '</table> <br> Regards,<br> '
                          || 'CRM Desk';
        lv_mail_response := xxeba_send_mail('CRM "@" Venturi Tools <CRM_Desk@4iapps.com>', 'rajan@venturitool.com', null, 'richard.d@4iapps.com'
        , lv_mail_subject,
                                            lv_v_body, lv_v_body_html);

        apex_mail.push_queue(
            p_smtp_hostname => '4iapps-com.mail.protection.outlook.com',
            p_smtp_portno   => 25
        );  
			-- end if;
    exception
        when others then
            xxfs_pm_error_log_pkg.record_log('ERROR', 'daily_trans_summary', sqlerrm);
					 -- raise_application_error(-20100,'Error in sending Email...'||sqlerrm);
    end xxeba_daily_trans_summary;

end xxebs_msk_sales_scheduler_pkg;
/


-- sqlcl_snapshot {"hash":"29f77abcbac01a708d6a34de4c990f03dfd209ce","type":"PACKAGE_BODY","name":"XXEBS_MSK_SALES_SCHEDULER_PKG","schemaName":"XXVENTURI","sxml":""}