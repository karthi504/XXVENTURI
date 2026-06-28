create index xxventuri.xlib_logs_idx1 on
    xxventuri.xlib_logs (
        log_type
    );


-- sqlcl_snapshot {"hash":"66e98ad8ad676ea4a017c1acc4cd22db23411548","type":"INDEX","name":"XLIB_LOGS_IDX1","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>XLIB_LOGS_IDX1</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>XLIB_LOGS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>LOG_TYPE</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}