alter table xxventuri.crm_leads_t
    add constraint crm_leads_conv_contact_fk
        foreign key ( converted_contact_id )
            references xxventuri.crm_contacts_t ( contact_id )
        enable;


-- sqlcl_snapshot {"hash":"536b3a9fb60ad663058bef986aa90d81d8cd7c15","type":"REF_CONSTRAINT","name":"CRM_LEADS_CONV_CONTACT_FK","schemaName":"XXVENTURI","sxml":""}