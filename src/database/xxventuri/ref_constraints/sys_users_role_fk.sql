alter table xxventuri.sys_users_t
    add constraint sys_users_role_fk
        foreign key ( role_id )
            references xxventuri.sys_roles_t ( role_id )
        enable;


-- sqlcl_snapshot {"hash":"6e38de8caf25ba7ca3d9033e3c12ee0b3d72d4bc","type":"REF_CONSTRAINT","name":"SYS_USERS_ROLE_FK","schemaName":"XXVENTURI","sxml":""}