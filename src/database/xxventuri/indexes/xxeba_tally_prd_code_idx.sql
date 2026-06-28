create index xxventuri.xxeba_tally_prd_code_idx on
    xxventuri.xxeba_tally_stock_t (
        product_code,
        batch_sequence
    );


-- sqlcl_snapshot {"hash":"6d7aa60e639386d5a7f47a2cbbf639be36794111","type":"INDEX","name":"XXEBA_TALLY_PRD_CODE_IDX","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>XXEBA_TALLY_PRD_CODE_IDX</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>XXEBA_TALLY_STOCK_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>PRODUCT_CODE</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>BATCH_SEQUENCE</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}