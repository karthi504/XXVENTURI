alter table xxventuri.crm_contacts_t
    add constraint crm_contacts_account_fk
        foreign key ( account_id )
            references xxventuri.crm_accounts_t ( account_id )
        enable;


-- sqlcl_snapshot {"hash":"667bc51667b0c9420dae7cfb94c7e3c22f0dfc2c","type":"REF_CONSTRAINT","name":"CRM_CONTACTS_ACCOUNT_FK","schemaName":"XXVENTURI","sxml":""}