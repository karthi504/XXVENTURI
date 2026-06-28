create unique index xxventuri.sys_roles_code_uk on
    xxventuri.sys_roles_t (
        case
            status_code
            when 'ACTIVE' then
                    role_code
        end
    );


-- sqlcl_snapshot {"hash":"be77370ea5dd8c68ac84bf134dc3166e2233cd34","type":"INDEX","name":"SYS_ROLES_CODE_UK","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <UNIQUE></UNIQUE>\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>SYS_ROLES_CODE_UK</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>SYS_ROLES_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <DEFAULT_EXPRESSION>CASE \"STATUS_CODE\" WHEN 'ACTIVE' THEN \"ROLE_CODE\" END </DEFAULT_EXPRESSION>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}