create or replace procedure xxventuri.sync_sales_order_p as

    v_count       number;
    lv_tally_flag varchar2(1);
    lv_tally_ref  varchar2(100);
    cursor cur_sales is
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
        tally_reference_number,
        updated_in_tally,
        approver_comments
					---,transaction_id
        ,
        source_application,
        order_type_id
    from
        xxeba_sales_order;

begin
    for rec_sales in cur_sales loop
        begin
            select
                count(1)
            into v_count
            from
                xxeba_sales_order@awsdb
            where
                order_id = rec_sales.order_id;

        exception
            when others then
                xxfs_pm_error_log_pkg.record_log('ERROR', 'SYNC_XXEBA_SALES_ORDER', 'v_count', 1);
        end;

        begin
            if v_count = 0 then
                insert into xxeba_sales_order@awsdb (
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
                    tally_reference_number,
                    updated_in_tally,
                    approver_comments
				---	,transaction_id
                    ,
                    source_application,
                    order_type_id
                ) values ( rec_sales.order_id,
                           rec_sales.deal_id,
                           rec_sales.customer_id,
                           rec_sales.territory_id,
                           rec_sales.sales_rep,
                           rec_sales.po_number,
                           rec_sales.po_date,
                           rec_sales.reference,
                           rec_sales.billing_location,
                           rec_sales.delivery_location,
                           rec_sales.order_frequency,
                           rec_sales.next_order_date,
                           rec_sales.created,
                           rec_sales.created_by,
                           rec_sales.updated,
                           rec_sales.updated_by,
                           rec_sales.status,
                           rec_sales.order_number,
                           rec_sales.order_date,
                           rec_sales.order_repeat,
                           rec_sales.latitude,
                           rec_sales.longitude,
                           rec_sales.last_updated_latitude,
                           rec_sales.last_updated_longitude,
                           rec_sales.remarks,
                           rec_sales.export_flag,
                           rec_sales.created_temp,
                           rec_sales.updated_temp,
                           rec_sales.tally_reference_number,
                           rec_sales.updated_in_tally,
                           rec_sales.approver_comments
				----	,rec_sales.transaction_id
                           ,
                           rec_sales.source_application,
                           rec_sales.order_type_id );

            else
                select
                    updated_in_tally,
                    tally_reference_number
                into
                    lv_tally_flag,
                    lv_tally_ref
                from
                    xxeba_sales_order@awsdb
                where
                    order_id = rec_sales.order_id;

                if lv_tally_ref is not null then
                    update xxeba_sales_order
                    set
                        updated_in_tally = lv_tally_flag,
                        tally_reference_number = lv_tally_ref
                    where
                        order_id = rec_sales.order_id;

                end if;
   
/*
UPDATE 
        XXEBA_SALES_ORDER@awsdb
SET 
		deal_id                    = rec_sales.deal_id
		,customer_id                = rec_sales.customer_id
		,territory_id               = rec_sales.territory_id
		,sales_rep                  = rec_sales.sales_rep
		,po_number                  = rec_sales.po_number
		,po_date                    = rec_sales.po_date
		,reference                  = rec_sales.reference
		,billing_location           = rec_sales.billing_location
		,delivery_location          = rec_sales.delivery_location
		,order_frequency            = rec_sales.order_frequency
		,next_order_date            = rec_sales.next_order_date
		,created                    = rec_sales.created
		,created_by                 = rec_sales.created_by
		,updated                    = rec_sales.updated
		,updated_by                 = rec_sales.updated_by
		,status                     = rec_sales.status
		,order_number               = rec_sales.order_number
		,order_date                 = rec_sales.order_date
		,order_repeat               = rec_sales.order_repeat 
		,latitude                   = rec_sales.latitude
		,longitude                  = rec_sales.longitude
		,last_updated_latitude      = rec_sales.last_updated_latitude
		,last_updated_longitude     = rec_sales.last_updated_longitude
		,remarks                    = rec_sales.remarks
		,export_flag                = rec_sales.export_flag
		,created_temp               = rec_sales.created_temp
		,updated_temp               = rec_sales.updated_temp
		,tally_reference_number     = rec_sales.tally_reference_number
		,updated_in_tally           = rec_sales.updated_in_tally
		,approver_comments          = rec_sales.approver_comments
	---	,transaction_id             = rec_sales.transaction_id
		,source_application         = rec_sales.source_application
		,order_type_id              = rec_sales.order_type_id
WHERE 
        order_id              = rec_sales.order_id;		
*/
            end if;

        exception
            when others then
                xxfs_pm_error_log_pkg.record_log('ERROR', 'SYNC_XXEBA_SALES_ORDER', 'XXEBA_SALES_ORDER', 2);
        end;

    end loop;

    commit;
exception
    when others then
        xxfs_pm_error_log_pkg.record_log('ERROR', 'SYNC_XXEBA_SALES_ORDER', 'INSERT- UPDATE - PROC', 3);
end sync_sales_order_p;
/


-- sqlcl_snapshot {"hash":"68f7b2d2c13f364393ba4f120bbaaac87c2938d3","type":"PROCEDURE","name":"SYNC_SALES_ORDER_P","schemaName":"XXVENTURI","sxml":""}