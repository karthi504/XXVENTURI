create or replace procedure xxventuri.ins_ds_callback_log (
    p_payload in clob
) is

    l_event_name      varchar2(100);
    l_envelope_id     varchar2(100);
    l_recipient_id    varchar2(50);
    l_account_id      varchar2(100);
    l_envelope_status varchar2(50);
    l_document_blob   blob;
    l_url             varchar2(1000);
    l_file_name       varchar2(200);
    l_access_token    varchar2(4000) := 'eyJ0eXAiOiJNVCIsImFsZyI6IlJTMjU2Iiwia2lkIjoiNjgxODVmZjEtNGU1MS00Y2U5LWFmMWMtNjg5ODEyMjAzMzE3In0.AQoAAAABAAUABwCAyDrqLk_eSAgAgAhe-HFP3kgCADA96EYuTsBMloRAT5nNSAQVAAEAAAAYAAEAAAAFAAAADQAkAAAAMzQ1MjI4NTYtM2I2OC00MWUyLTgzYjgtY2FlNWUwMGI1Y2MzIgAkAAAAMzQ1MjI4NTYtM2I2OC00MWUyLTgzYjgtY2FlNWUwMGI1Y2MzMAAAbc3ALU_eSDcAhlF73elj_UyfLAG1n_E6bg.h6UbpUHUi3U2McaSW5t9GJsSkDmwuXZ012FE1If8UOrxcyzbqQpvJ0JSpM-H2c3b2jcglH5LDWrtUzF0xBUG6lSYUmvu_wp48-XvQ6NJ2yBnD5yR9NWT31AdUVIqE_jupV1UF2-_Ce3kzz6-ixTzlMG865AREWk3OT07-ZSN2SRdC0T21m5gOtd2rfodkisVGgqwefmmak7jlrajGg3UFYgcenQ8x6BQqvY8Dbo5EPyKKgvoli11khWqQFbdZrF9ZGDLAqR706Ap4FRIyzk7QFnrnbC71lcXmIhUgDJJypkJMkRK0D6cKvYnrsyNhiTJaz_r2G-UHNQAA2cHkYL0Yg'
    ;
begin
    /*----------------------------------------------------
      1. Extract values from DocuSign JSON payload
    ----------------------------------------------------*/
    l_event_name := json_value(p_payload, '$.event');
    l_envelope_id := json_value(p_payload, '$.data.envelopeId');
    l_recipient_id := json_value(p_payload, '$.data.recipientId');
    l_account_id := json_value(p_payload, '$.data.accountId');
    l_envelope_status := json_value(p_payload, '$.data.envelopeSummary.status');
    l_file_name := 'SIGNED_'
                   || l_envelope_id
                   || '.pdf';
 
    /*----------------------------------------------------
      2. DocuSign document download URL
    ----------------------------------------------------*/
    l_url := 'https://demo.docusign.net/restapi/v2.1/accounts/'
             || l_account_id
             || '/envelopes/'
             || l_envelope_id
             || '/documents/1';
 
    /*----------------------------------------------------
      3. HTTP Headers (PDF specific)
    ----------------------------------------------------*/
    apex_web_service.g_request_headers.delete;
    apex_web_service.g_request_headers(1).name := 'Authorization';
    apex_web_service.g_request_headers(1).value := 'Bearer ' || l_access_token;
    apex_web_service.g_request_headers(2).name := 'Accept';
    apex_web_service.g_request_headers(2).value := 'application/pdf';
 
    /*----------------------------------------------------
      4. Download PDF as BLOB
    ----------------------------------------------------*/
    l_document_blob := apex_web_service.make_rest_request_b(
        p_url         => l_url,
        p_http_method => 'GET'
    );
 
    /*----------------------------------------------------
      5. Insert into table
    ----------------------------------------------------*/
    insert into ds_envelope_callback_log (
        event_name,
        envelope_id,
        recipient_id,
        account_id,
        envelope_status,
        callback_payload,
        signed_file_blob,
        mime_type
    ) values ( l_event_name,
               l_envelope_id,
               l_recipient_id,
               l_account_id,
               l_envelope_status,
               p_payload,
               l_document_blob,
               'application/pdf' );

    commit;
end ins_ds_callback_log;
/


-- sqlcl_snapshot {"hash":"a545432f759697236d0bc26554296e187ab17509","type":"PROCEDURE","name":"INS_DS_CALLBACK_LOG","schemaName":"XXVENTURI","sxml":""}