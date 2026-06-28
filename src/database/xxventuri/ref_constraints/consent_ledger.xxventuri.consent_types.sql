alter table xxventuri.consent_ledger
    add
        foreign key ( type_id )
            references xxventuri.consent_types ( type_id )
        enable;


-- sqlcl_snapshot {"hash":"b8231c48b2c885f4f7a04cda215c8331cd0ca5e5","type":"REF_CONSTRAINT","name":"CONSENT_LEDGER.XXVENTURI.CONSENT_TYPES","schemaName":"XXVENTURI","sxml":""}