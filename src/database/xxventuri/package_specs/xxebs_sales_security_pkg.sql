create or replace package xxventuri.xxebs_sales_security_pkg as 
 
    ------------------------------------------------------------------------- 
    -- Checks for valid User Account to login     
	------------------------------------------------------------------------- 

    function get_user_authentication (
        p_username varchar2,
        p_password varchar2
    ) return boolean;

    function get_password_hash_value (
        p_password in varchar2
    ) return varchar2;

    procedure clear_tally_records;

    function get_location_details (
        p_att_id in number,
        p1       in varchar2
    ) return varchar2;

    function encrypt (
        p_plaintext varchar2
    ) return raw
        deterministic;

    function decrypt (
        p_encryptedtext raw
    ) return varchar2
        deterministic;

end xxebs_sales_security_pkg;
/


-- sqlcl_snapshot {"hash":"158b432be2118500de5c4a39161e9027a51af364","type":"PACKAGE_SPEC","name":"XXEBS_SALES_SECURITY_PKG","schemaName":"XXVENTURI","sxml":""}