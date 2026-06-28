create or replace package xxventuri.consent_ledger_pkg as

    -- Function to create a hash (like a fingerprint)
    function make_hash (
        p_subject_id in varchar2,
        p_type_id    in varchar2,
        p_action     in varchar2,
        p_prev_hash  in raw,
        p_details    in varchar2,
        p_date       in timestamp
    ) return raw;

    -- Function to add a new consent record
    procedure add_consent (
        p_subject_id  in varchar2,
        p_type_id     in varchar2,
        p_action      in varchar2,
        p_details     in varchar2,
        p_valid_until in date default null
    );

    function verify_type_chain (
        p_subject_id in varchar2,
        p_type_id    in varchar2
    ) return varchar2;
    -- Function to check if chain is valid
    function verify_chain (
        p_subject_id in varchar2
    ) return varchar2;

    procedure send_tamper_alert (
        p_subject_id      in varchar2,
        p_type_id         in varchar2,
        p_ledger_id       in varchar2,
        p_recipient_email in varchar2
    );

end consent_ledger_pkg;
/


-- sqlcl_snapshot {"hash":"68e6ff9bd757728d3a3638b89d7360d683e35dd9","type":"PACKAGE_SPEC","name":"CONSENT_LEDGER_PKG","schemaName":"XXVENTURI","sxml":""}