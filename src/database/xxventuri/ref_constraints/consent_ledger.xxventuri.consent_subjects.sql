alter table xxventuri.consent_ledger
    add
        foreign key ( subject_id )
            references xxventuri.consent_subjects ( subject_id )
        enable;


-- sqlcl_snapshot {"hash":"e38127430816d71a6c06f2ab0d749866a0f766b8","type":"REF_CONSTRAINT","name":"CONSENT_LEDGER.XXVENTURI.CONSENT_SUBJECTS","schemaName":"XXVENTURI","sxml":""}