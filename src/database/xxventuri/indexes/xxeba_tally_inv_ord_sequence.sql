create index xxventuri.xxeba_tally_inv_ord_sequence on
    xxventuri.xxeba_tally_invoices_t (
        sales_order_number,
        batch_sequence
    );


-- sqlcl_snapshot {"hash":"89803d9e1ac19d49f7831a211baa7347fd8d5bf4","type":"INDEX","name":"XXEBA_TALLY_INV_ORD_SEQUENCE","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>XXEBA_TALLY_INV_ORD_SEQUENCE</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>XXEBA_TALLY_INVOICES_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>SALES_ORDER_NUMBER</NAME>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>BATCH_SEQUENCE</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}