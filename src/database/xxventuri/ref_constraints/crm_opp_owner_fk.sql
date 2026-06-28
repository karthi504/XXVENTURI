alter table xxventuri.crm_opportunities_t
    add constraint crm_opp_owner_fk
        foreign key ( owner_id )
            references xxventuri.sys_users_t ( user_id )
        enable;


-- sqlcl_snapshot {"hash":"b086ac1c79a7076d347f3aeb8e279c188c3e18a4","type":"REF_CONSTRAINT","name":"CRM_OPP_OWNER_FK","schemaName":"XXVENTURI","sxml":""}