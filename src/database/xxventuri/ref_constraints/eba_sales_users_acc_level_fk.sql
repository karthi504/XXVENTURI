alter table xxventuri.eba_sales_users
    add constraint eba_sales_users_acc_level_fk
        foreign key ( access_level_id )
            references xxventuri.eba_sales_access_levels ( id )
        enable;


-- sqlcl_snapshot {"hash":"1d0e13a92db41e85942bf2ce05c5d936c41f25a3","type":"REF_CONSTRAINT","name":"EBA_SALES_USERS_ACC_LEVEL_FK","schemaName":"XXVENTURI","sxml":""}