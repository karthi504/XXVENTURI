alter table xxventuri.crm_contacts_t
    add constraint crm_contacts_owner_fk
        foreign key ( owner_id )
            references xxventuri.sys_users_t ( user_id )
        enable;


-- sqlcl_snapshot {"hash":"53260aa1d06ffff1c7e5dc46255b9278350265a0","type":"REF_CONSTRAINT","name":"CRM_CONTACTS_OWNER_FK","schemaName":"XXVENTURI","sxml":""}