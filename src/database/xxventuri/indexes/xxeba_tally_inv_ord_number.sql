create index xxventuri.xxeba_tally_inv_ord_number on
    xxventuri.xxeba_tally_invoices_t (
        sales_order_number
    );


-- sqlcl_snapshot {"hash":"2a6355ec390d4a02d283322137a96a58405b8dd0","type":"INDEX","name":"XXEBA_TALLY_INV_ORD_NUMBER","schemaName":"XXVENTURI","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>XXVENTURI</SCHEMA>\n   <NAME>XXEBA_TALLY_INV_ORD_NUMBER</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>XXVENTURI</SCHEMA>\n         <NAME>XXEBA_TALLY_INVOICES_T</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>SALES_ORDER_NUMBER</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}