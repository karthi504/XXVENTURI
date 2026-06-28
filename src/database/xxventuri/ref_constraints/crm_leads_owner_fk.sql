alter table xxventuri.crm_leads_t
    add constraint crm_leads_owner_fk
        foreign key ( owner_id )
            references xxventuri.sys_users_t ( user_id )
        enable;


-- sqlcl_snapshot {"hash":"22678b116abb5f9f04bf6756ef912084d8f4079e","type":"REF_CONSTRAINT","name":"CRM_LEADS_OWNER_FK","schemaName":"XXVENTURI","sxml":""}