create index xxventuri.eba_sales_states_i2 on
    xxventuri.eba_sales_states (
        code
    );


-- sqlcl_snapshot {"hash":"4c0752e7f28732b5cd16fb954e4ff8b251731955","type":"INDEX","name":"EBA_SALES_STATES_I2","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>EBA_SALES_STATES_I2</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>EBA_SALES_STATES</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>CODE</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}