create unique index xxventuri.crm_accounts_name_uk on
    xxventuri.crm_accounts_t (
        case
            status_code
            when 'ACTIVE' then
                    account_name
        end
    );


-- sqlcl_snapshot {"hash":"9d5296627da429067836946b52572fa9ddd5c63c","type":"INDEX","name":"CRM_ACCOUNTS_NAME_UK","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>CRM_ACCOUNTS_NAME_UK</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>CRM_ACCOUNTS_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>CASE \"STATUS_CODE\" WHEN 'ACTIVE' THEN \"ACCOUNT_NAME\" END </DEFAULT_EXPRESSION>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}