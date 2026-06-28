alter table xxventuri.crm_leads_t
    add constraint crm_leads_conv_acct_fk
        foreign key ( converted_account_id )
            references xxventuri.crm_accounts_t ( account_id )
        enable;


-- sqlcl_snapshot {"hash":"bba971040570d8c324ffa3a78d5f67e3894fe9ca","type":"REF_CONSTRAINT","name":"CRM_LEADS_CONV_ACCT_FK","schemaName":"XXVENTURI","sxml":""}