alter table xxventuri.crm_opportunities_t
    add constraint crm_opp_contact_fk
        foreign key ( contact_id )
            references xxventuri.crm_contacts_t ( contact_id )
        enable;


-- sqlcl_snapshot {"hash":"70bab12d93af0b5b7f73034750d6b3bb9f88eacb","type":"REF_CONSTRAINT","name":"CRM_OPP_CONTACT_FK","schemaName":"XXVENTURI","sxml":""}