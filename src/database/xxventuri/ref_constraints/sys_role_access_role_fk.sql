alter table xxventuri.sys_role_access_t
    add constraint sys_role_access_role_fk
        foreign key ( role_id )
            references xxventuri.sys_roles_t ( role_id )
        enable;


-- sqlcl_snapshot {"hash":"ee7237eb5900a7af5f57da659b9ef833b33d62ee","type":"REF_CONSTRAINT","name":"SYS_ROLE_ACCESS_ROLE_FK","schemaName":"XXVENTURI","sxml":""}