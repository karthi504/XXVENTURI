alter table xxventuri.crm_opportunities_t
    add constraint crm_opp_account_fk
        foreign key ( account_id )
            references xxventuri.crm_accounts_t ( account_id )
        enable;


-- sqlcl_snapshot {"hash":"846d1fd1f6173f3c39ae547dbab1561e84a01f30","type":"REF_CONSTRAINT","name":"CRM_OPP_ACCOUNT_FK","schemaName":"XXVENTURI","sxml":""}