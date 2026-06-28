alter table xxventuri.crm_leads_t
    add constraint crm_leads_conv_opp_fk
        foreign key ( converted_opportunity_id )
            references xxventuri.crm_opportunities_t ( opportunity_id )
        enable;


-- sqlcl_snapshot {"hash":"64520e89a78300624f8a58610343e36d01c71816","type":"REF_CONSTRAINT","name":"CRM_LEADS_CONV_OPP_FK","schemaName":"XXVENTURI","sxml":""}