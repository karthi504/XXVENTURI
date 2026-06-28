create index xxventuri.xlib_logs_idx2 on
    xxventuri.xlib_logs (
        log_module
    );


-- sqlcl_snapshot {"hash":"6851a9d83391071e85e397c9a6282fca8d57eb09","type":"INDEX","name":"XLIB_LOGS_IDX2","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>XLIB_LOGS_IDX2</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>XLIB_LOGS</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>LOG_MODULE</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}