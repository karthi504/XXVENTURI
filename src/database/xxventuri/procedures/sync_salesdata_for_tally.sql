create or replace procedure xxventuri.sync_salesdata_for_tally is
/*** 1. Sync Data: crm_accounts_v  ***/
begin
    commit;
    insert into crm_accounts_temp (
        unique_id,
        customer_id,
        customer_name,
        gst_no,
        credit_terms_rec,
        contact_id,
        contact_name,
        contact_email,
        contact_phone,
        contact_cell,
        bank_name,
        branch_location,
        account_number,
        ifsc_code,
        staff_code,
        credit_limit_rec
    )
        (
            select
                unique_id,
                customer_id,
                customer_name,
                gst_no,
                credit_terms_rec,
                contact_id,
                contact_name,
                contact_email,
                contact_phone,
                contact_cell,
                bank_name,
                branch_location,
                account_number,
                ifsc_code,
                staff_code,
                credit_limit_rec
            from
                crm_accounts_v
        );

    merge into crm_accounts_v@awsdb1 x
    using (
        select
            unique_id,
            customer_id,
            customer_name,
            gst_no,
            credit_terms_rec,
            contact_id,
            contact_name,
            contact_email,
            contact_phone,
            contact_cell,
            bank_name,
            branch_location,
            account_number,
            ifsc_code,
            staff_code,
            credit_limit_rec
        from
            crm_accounts_temp   /* crm_accounts_v */
        minus
        select
            unique_id,
            customer_id,
            customer_name,
            gst_no,
            credit_terms_rec,
            contact_id,
            contact_name,
            contact_email,
            contact_phone,
            contact_cell,
            bank_name,
            branch_location,
            account_number,
            ifsc_code,
            staff_code,
            credit_limit_rec
        from
            crm_accounts_v@awsdb1
    ) y on ( x.unique_id = y.unique_id )
    when matched then update
    set x.customer_id = y.customer_id,
        x.customer_name = y.customer_name,
        x.gst_no = y.gst_no,
        x.credit_terms_rec = y.credit_terms_rec,
        x.contact_id = y.contact_id,
        x.contact_name = y.contact_name,
        x.contact_email = y.contact_email,
        x.contact_phone = y.contact_phone,
        x.contact_cell = y.contact_cell,
        x.bank_name = y.bank_name,
        x.branch_location = y.branch_location,
        x.account_number = y.account_number,
        x.ifsc_code = y.ifsc_code,
        x.staff_code = y.staff_code,
        x.credit_limit_rec = y.credit_limit_rec
    where
        x.unique_id = y.unique_id
    when not matched then
    insert (
        x.unique_id,
        x.customer_id,
        x.customer_name,
        x.gst_no,
        x.credit_terms_rec,
        x.contact_id,
        x.contact_name,
        x.contact_email,
        x.contact_phone,
        x.contact_cell,
        x.bank_name,
        x.branch_location,
        x.account_number,
        x.ifsc_code,
        x.staff_code,
        x.credit_limit_rec )
    values
        ( y.unique_id,
          y.customer_id,
          y.customer_name,
          y.gst_no,
          y.credit_terms_rec,
          y.contact_id,
          y.contact_name,
          y.contact_email,
          y.contact_phone,
          y.contact_cell,
          y.bank_name,
          y.branch_location,
          y.account_number,
          y.ifsc_code,
          y.staff_code,
          y.credit_limit_rec );

    commit;

   /*** 2. Sync Data: crm_account_locations_v  ***/
    merge into crm_account_locations_v@awsdb1 x
    using (
        select
            customer_name,
            unique_id,
            customer_id,
            location_id,
            customer_location_name,
            customer_address1,
            customer_address2,
            customer_postal_code,
            country_name,
            state_name,
            city_name
        from
            crm_account_locations_v
        minus
        select
            customer_name,
            unique_id,
            customer_id,
            location_id,
            customer_location_name,
            customer_address1,
            customer_address2,
            customer_postal_code,
            country_name,
            state_name,
            city_name
        from
            crm_account_locations_v@awsdb1
    ) y on ( x.location_id = y.location_id )
    when matched then update
    set x.customer_name = y.customer_name,
        x.customer_id = y.customer_id
             --   ,x.location_id = y.location_id
        ,
        x.customer_location_name = y.customer_location_name,
        x.customer_address1 = y.customer_address1,
        x.customer_address2 = y.customer_address2,
        x.customer_postal_code = y.customer_postal_code,
        x.country_name = y.country_name,
        x.state_name = y.state_name,
        x.city_name = y.city_name
    where
        x.location_id = y.location_id
    when not matched then
    insert (
        x.customer_name,
        x.unique_id,
        x.customer_id,
        x.location_id,
        x.customer_location_name,
        x.customer_address1,
        x.customer_address2,
        x.customer_postal_code,
        x.country_name,
        x.state_name,
        x.city_name )
    values
        ( y.customer_name,
          y.unique_id,
          y.customer_id,
          y.location_id,
          y.customer_location_name,
          y.customer_address1,
          y.customer_address2,
          y.customer_postal_code,
          y.country_name,
          y.state_name,
          y.city_name );

    commit;

   /*** 3. Sync Data: crm_products_v  ***/
    merge into crm_products_v@awsdb1 x
    using (
        select
            product_id,
            product_code,
            product_name,
            hsn_code,
            product_brand,
            sub_group,
            uom,
            sku_category,
            has_batch,
            has_mfg_dt,
            has_exp_dt,
            std_cost_price,
            std_selling_price,
            unique_id,
            tax_percentage
        from
            crm_products_v
        minus
        select
            product_id,
            product_code,
            product_name,
            hsn_code,
            product_brand,
            sub_group,
            uom,
            sku_category,
            has_batch,
            has_mfg_dt,
            has_exp_dt,
            std_cost_price,
            std_selling_price,
            unique_id,
            tax_percentage
        from
            crm_products_v@awsdb1
    ) y on ( x.unique_id = y.unique_id )
    when matched then update
    set x.product_code = y.product_code,
        x.product_name = y.product_name,
        x.hsn_code = y.hsn_code,
        x.product_brand = y.product_brand,
        x.sub_group = y.sub_group,
        x.uom = y.uom,
        x.sku_category = y.sku_category,
        x.has_batch = y.has_batch,
        x.has_mfg_dt = y.has_mfg_dt,
        x.has_exp_dt = y.has_exp_dt,
        x.std_cost_price = y.std_cost_price,
        x.std_selling_price = y.std_selling_price,
        x.product_id = y.product_id,
        x.tax_percentage = y.tax_percentage
    where
        x.unique_id = y.unique_id
    when not matched then
    insert (
        x.product_id,
        x.product_code,
        x.product_name,
        x.hsn_code,
        x.product_brand,
        x.sub_group,
        x.uom,
        x.sku_category,
        x.has_batch,
        x.has_mfg_dt,
        x.has_exp_dt,
        x.std_cost_price,
        x.std_selling_price,
        x.unique_id,
        x.tax_percentage )
    values
        ( y.product_id,
          y.product_code,
          y.product_name,
          y.hsn_code,
          y.product_brand,
          y.sub_group,
          y.uom,
          y.sku_category,
          y.has_batch,
          y.has_mfg_dt,
          y.has_exp_dt,
          y.std_cost_price,
          y.std_selling_price,
          y.unique_id,
          y.tax_percentage );

    commit;

   /*** 4. Sync Data: crm_users_v  ***/
    merge into crm_users_v@awsdb1 x
    using (
        select
            unique_id,
            staff_code,
            user_name,
            rep_last_name,
            rep_first_name,
            rep_email,
            row_key
        from
            crm_users_v
        minus
        select
            unique_id,
            staff_code,
            user_name,
            rep_last_name,
            rep_first_name,
            rep_email,
            row_key
        from
            crm_users_v@awsdb1
    ) y on ( x.unique_id = y.unique_id )
    when matched then update
    set x.staff_code = y.staff_code,
        x.user_name = y.user_name,
        x.rep_last_name = y.rep_last_name,
        x.rep_first_name = y.rep_first_name,
        x.rep_email = y.rep_email,
        x.row_key = y.row_key
    where
        x.unique_id = y.unique_id
    when not matched then
    insert (
        x.unique_id,
        x.staff_code,
        x.user_name,
        x.rep_last_name,
        x.rep_first_name,
        x.rep_email,
        x.row_key )
    values
        ( y.unique_id,
          y.staff_code,
          y.user_name,
          y.rep_last_name,
          y.rep_first_name,
          y.rep_email,
          y.row_key );

    commit;

   /*** 5. Sync Data: crm_products_stock_cost_v  ***/
    begin
        delete from crm_products_stock_cost_v@awsdb1;

        insert into crm_products_stock_cost_v@awsdb1
            select
                *
            from
                crm_products_stock_cost_v;

        commit;
    end;

   /*** 6. Sync Data: xxeba_sales_order -update Tally reference for imported records ***/

    merge into xxeba_sales_order x
    using (
        select
            order_id,
            tally_reference_number,
            updated_in_tally
        from
            xxeba_sales_order@awsdb1
        minus
        select
            order_id,
            tally_reference_number,
            updated_in_tally
        from
            xxeba_sales_order
    ) y on ( x.order_id = y.order_id )
    when matched then update
    set x.tally_reference_number = y.tally_reference_number,
        x.updated_in_tally = y.updated_in_tally
    where
        x.order_id = y.order_id;

    commit;

   /*** 7. Sync Data: xxeba_sales_order - Insert New Sales Orders to Sales Order table ***/
    merge into xxeba_sales_order@awsdb1 x
    using (
        select
            order_id,
            deal_id,
            customer_id,
            territory_id,
            sales_rep,
            po_number,
            po_date,
            reference,
            billing_location,
            delivery_location,
            order_frequency,
            next_order_date,
            created,
            created_by,
            updated,
            updated_by,
            status,
            order_number,
            order_date,
            order_repeat,
            latitude,
            longitude,
            last_updated_latitude,
            last_updated_longitude,
            remarks,
            export_flag,
            created_temp,
            updated_temp,
            approver_comments,
            transaction_id,
            source_application,
            order_type_id
        from
            xxeba_sales_order
        minus
        select
            order_id,
            deal_id,
            customer_id,
            territory_id,
            sales_rep,
            po_number,
            po_date,
            reference,
            billing_location,
            delivery_location,
            order_frequency,
            next_order_date,
            created,
            created_by,
            updated,
            updated_by,
            status,
            order_number,
            order_date,
            order_repeat,
            latitude,
            longitude,
            last_updated_latitude,
            last_updated_longitude,
            remarks,
            export_flag,
            created_temp,
            updated_temp,
            approver_comments,
            transaction_id,
            source_application,
            order_type_id
        from
            xxeba_sales_order@awsdb1
    ) y on ( x.order_id = y.order_id )
    when matched then update
    set x.deal_id = y.deal_id,
        x.customer_id = y.customer_id,
        x.territory_id = y.territory_id,
        x.sales_rep = y.sales_rep,
        x.po_number = y.po_number,
        x.po_date = y.po_date,
        x.reference = y.reference,
        x.billing_location = y.billing_location,
        x.delivery_location = y.delivery_location,
        x.order_frequency = y.order_frequency,
        x.next_order_date = y.next_order_date,
        x.created = y.created,
        x.created_by = y.created_by,
        x.updated = y.updated,
        x.updated_by = y.updated_by,
        x.status = y.status,
        x.order_number = y.order_number,
        x.order_date = y.order_date,
        x.order_repeat = y.order_repeat,
        x.latitude = y.latitude,
        x.longitude = y.longitude,
        x.last_updated_latitude = y.last_updated_latitude,
        x.last_updated_longitude = y.last_updated_longitude,
        x.remarks = y.remarks,
        x.export_flag = y.export_flag,
        x.created_temp = y.created_temp,
        x.updated_temp = y.updated_temp,
        x.approver_comments = y.approver_comments,
        x.transaction_id = y.transaction_id,
        x.source_application = y.source_application,
        x.order_type_id = y.order_type_id
    where
        x.order_id = y.order_id
    when not matched then
    insert (
        x.order_id,
        x.deal_id,
        x.customer_id,
        x.territory_id,
        x.sales_rep,
        x.po_number,
        x.po_date,
        x.reference,
        x.billing_location,
        x.delivery_location,
        x.order_frequency,
        x.next_order_date,
        x.created,
        x.created_by,
        x.updated,
        x.updated_by,
        x.status,
        x.order_number,
        x.order_date,
        x.order_repeat,
        x.latitude,
        x.longitude,
        x.last_updated_latitude,
        x.last_updated_longitude,
        x.remarks,
        x.export_flag,
        x.created_temp,
        x.updated_temp,
        x.approver_comments,
        x.transaction_id,
        x.source_application,
        x.order_type_id )
    values
        ( y.order_id,
          y.deal_id,
          y.customer_id,
          y.territory_id,
          y.sales_rep,
          y.po_number,
          y.po_date,
          y.reference,
          y.billing_location,
          y.delivery_location,
          y.order_frequency,
          y.next_order_date,
          y.created,
          y.created_by,
          y.updated,
          y.updated_by,
          y.status,
          y.order_number,
          y.order_date,
          y.order_repeat,
          y.latitude,
          y.longitude,
          y.last_updated_latitude,
          y.last_updated_longitude,
          y.remarks,
          y.export_flag,
          y.created_temp,
          y.updated_temp,
          y.approver_comments,
          y.transaction_id,
          y.source_application,
          y.order_type_id );

    commit;

   /*** 8. Sync Data: crm_sales_orders_v ***/
    begin
        delete from crm_sales_orders_v@awsdb1;

        insert into crm_sales_orders_v@awsdb1
            select
                *
            from
                crm_sales_orders_v;

        commit;
    end;

    commit;
end sync_salesdata_for_tally;
/


-- sqlcl_snapshot {"hash":"790e0a7552c30a004affd8471d03f1dd254bc566","type":"PROCEDURE","name":"SYNC_SALESDATA_FOR_TALLY","schemaName":"XXVENTURI","sxml":""}