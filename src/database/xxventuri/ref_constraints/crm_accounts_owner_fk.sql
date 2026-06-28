alter table xxventuri.crm_accounts_t
    add constraint crm_accounts_owner_fk
        foreign key ( owner_id )
            references xxventuri.sys_users_t ( user_id )
        enable;


-- sqlcl_snapshot {"hash":"e464a2812f4c7c7e4d6e69adc1832dcc7322502f","type":"REF_CONSTRAINT","name":"CRM_ACCOUNTS_OWNER_FK","schemaName":"XXVENTURI","sxml":""}