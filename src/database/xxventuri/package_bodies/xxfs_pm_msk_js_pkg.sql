create or replace package body xxventuri.xxfs_pm_msk_js_pkg as 
----------------------------------------------------------------------------
--    Name              Date            Object Name                    Incident No                   Purpose
-- Karkuvelraja T    08-Nov-2017      XXFS_LOB_DOWNLOAD_PROC               --           To generate IReport PDF and save into oracle directory.
-- Karkuvelraja T    08-Nov-2017      XXFS_LOB_MAIL_PROC                   --           To generate send as mail with attachment.
-- Karkuvelraja T    08-Nov-2017      XXFS_GENERATE_PDF_INVOICE_PROC       --           To generate IReport PDF and save into oracle directory. then, send as pdf attachment.
----------------------------------------------------------------------------
    procedure xxfs_lob_download_proc (
        p_url             in varchar2 default null,
        p_report_name     in varchar2 default null,
        p_report_format   in varchar2 default null,
        p_datasoure       in varchar2 default null,
        p_outfilename     in varchar2 default null,
        p_report_language in varchar2 default null,
        p_encode          in varchar2 default null,
        p_filename        in varchar2 default null,
        p_p1              in number,
        p_p2              in varchar2,
        p_p3              in varchar2,
        p_p4              in varchar2,
        p_p5              in varchar2,
        p_p6              in varchar2,
        p_p7              in varchar2,
        p_p8              in varchar2,
        p_p9              in varchar2,
        p_qut_id          out number
    ) is

        lv_url       varchar2(32767);
        lhttp_url    httpuritype;
        lc_return    blob;
        l_file       utl_file.file_type;
        l_blob_len   integer;
        l_pos        integer := 1;
        l_amount     binary_integer := 32767;
        l_buffer     raw(32767);
        l_content    blob;
        v_attach_id  number;
        v_company_id number;
    begin
      /*  To Generate IReport PDF and save inot oracle directory*/
        begin
            select
                preference_value
            into v_company_id
            from
                eba_sales_preferences
            where
                preference_name = 'COMPANY_ID';

            if v_company_id = 1 then
                lv_url := p_url
                          || 'report?_repName='
                          || p_report_name
                          || '&'
                          || '_repFormat='
                          || p_report_format
                          || '&'
                          || '_dataSource='
                          || p_datasoure
                          || '&'
                          || '_outFilename='
                          || p_outfilename
                          || '&'
                          || '_repLocale='
                          || p_report_language
                          || '&'
                          || '_repEncoding='
                          || p_encode
                          || '&'
                          || 'p1='
                          || p_p1
                          || '&'
                          || 'p2='
                          || p_p2
                          || '&'
                          || 'p3='
                          || p_p3
                          || '&'
                          || 'p4='
                          || p_p4
                          || '&'
                          || 'p5='
                          || p_p5
                          || '&'
                          || 'p6='
                          || p_p6
                          || '&'
                          || 'p7='
                          || p_p7
                          || '&'
                          || 'p8='
                          || p_p8
                          || '&'
                          || 'p9='
                          || p_p9;

            elsif v_company_id = 2 then
                lv_url := p_url
                          || 'report?_repName='
                          || p_report_name
                          || '&'
                          || '_repFormat='
                          || p_report_format
                          || '&'
                          || '_dataSource='
                          || p_datasoure
                          || '&'
                          || '_outFilename='
                          || p_outfilename
                          || '&'
                          || '_repLocale='
                          || p_report_language
                          || '&'
                          || '_repEncoding='
                          || p_encode
                          || '&'
                          || 'p1='
                          || p_p1
                          || '&'
                          || 'p2='
                          || p_p2
                          || '&'
                          || 'p3='
                          || p_p3;
            end if;

            dbms_output.put_line(lv_url);
            xxfs_pm_error_log_pkg.record_log('LOG', 'MSK_Tools_Quotation_Email', lv_url, 1);
            xxfs_pm_error_log_pkg.record_log('LOG', 'MSK_Tools_Quotation_Email', lv_url, 1); 
         -- To Create URL
            lhttp_url := httpuritype.createuri(trim(lv_url));
            utl_http.set_wallet('file:/u01/app/oracle/product/wallet/staging_1', 'Fmw_36ui');
            xxfs_pm_error_log_pkg.record_log('LOG', 'MSK_Tools_Quotation_Email', 'Sucess 1', 1); 
         --DBMS_OUTPUT.PUT_LINE (LHTTP_URL);
         -- To get PDF Document from IReport 
            lc_return := lhttp_url.getblob();
            xxfs_pm_error_log_pkg.record_log('LOG', 'MSK_Tools_Quotation_Email', 'Sucess 2' || 'HTTPURITYPE.CREATEURI', 1); 
         -- LC_RETURN :=  HTTPURITYPE.CREATEURI (trim(LV_URL)).GETBLOB();
            dbms_output.put_line(l_pos);
            xxfs_pm_error_log_pkg.record_log('LOG', 'MSK_Tools_Quotation_Email', 'Sucess 2' || l_pos, 1); 
         -- To open the destination file. (Oracle Directory)
            l_file := utl_file.fopen('IMPDP', p_filename, 'wb');
            xxfs_pm_error_log_pkg.record_log('LOG', 'MSK_Tools_Quotation_Email', 'Sucess 3', 1);
            insert into eba_sales_files (
                deal_id,
                filename,
                file_mimetype,
                file_blob,
                entity_type
            ) values ( p_p1,
                       p_filename,
                       'application/pdf',
                       lc_return,
                       'OPPORTUNITY' ) returning id into v_attach_id;

            p_qut_id := v_attach_id;
         -- To get the total length of BLO
            l_blob_len := dbms_lob.getlength(lc_return);
         -- To read chunks of the BLOB and write them to the file until complete.
            while l_pos < l_blob_len loop
                dbms_lob.read(lc_return, l_amount, l_pos, l_buffer);
                utl_file.put_raw(l_file, l_buffer, false);
                l_pos := l_pos + l_amount;
            end loop;
         -- To close the file.
            utl_file.fclose(l_file);
        exception
            when others then
                xxfs_pm_error_log_pkg.record_log('ERROR', 'MSK_Tools_Quotation_Email', sqlerrm, 1); 
            -- To close the file if something goes wrong.
                if utl_file.is_open(l_file) then
                    utl_file.fclose(l_file);
                end if;
                raise_application_error(-20011, sqlerrm);
         -- dbms_output.put_line(sqlerrm);
        end;
     /*  End of generate IReport PDF and save into oracle directory */
    end xxfs_lob_download_proc;

end xxfs_pm_msk_js_pkg;
/


-- sqlcl_snapshot {"hash":"6e79024851c8ac4e0abc09af21aae4400118daea","type":"PACKAGE_BODY","name":"XXFS_PM_MSK_JS_PKG","schemaName":"XXVENTURI","sxml":""}