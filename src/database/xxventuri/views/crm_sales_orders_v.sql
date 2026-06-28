create or replace force editionable view xxventuri.crm_sales_orders_v (
    order_id,
    order_number,
    customer_unique_id,
    customer_id,
    po_number,
    po_date,
    reference,
    billing_location,
    delivery_location,
    order_date,
    remarks,
    order_products_id,
    brand_id,
    product_id,
    staff_code,
    product_name,
    quantity,
    product_price,
    currency_type,
    delivery_date,
    customer_name,
    gst_no,
    customer_address1,
    customer_address2,
    customer_location_name,
    updated_in_tally,
    part_number
) as
    select
        so.order_number as order_id,
        so.order_number as order_number,
        so.customer_id  as customer_unique_id,
        c.row_key       as customer_id,
        so.po_number,
        so.po_date,
        so.reference,
        (
            select
                row_key
            from
                eba_sales_customer_locations
            where
                id = so.billing_location
        )               as billing_location,
        (
            select
                row_key
            from
                eba_sales_customer_locations
            where
                id = so.delivery_location
        )               as delivery_location,
        so.order_date,
        so.remarks,
        op.row_key      as order_products_id,
        op.brand_id,
        (
            select
                row_key
            from
                eba_sales_products
            where
                id = op.product_id
        )               as product_id,
        (
            select
                row_key
            from
                eba_sales_salesreps
            where
                id = sales_rep
        )               as staff_code,
        op.product_name,
        op.quantity,
        op.product_price,
        op.currency_type,
        op.delivery_date,
        c.customer_name,
        c.gst_no,
        cl.customer_address1,
        cl.customer_address2,
        cl.customer_location_name,
        so.updated_in_tally,
--PRODUCT_NAME AS PART_NUMBER
--ACC.PART_NUMBER AS PART_NUMBER
--(select ACC.PART_NUMBER from XXEBA_SALES_ACC_PRODUCTS ACC where ACC.CUSTOMER_ID = C.ID and ACC.PRODUCT_ID = OP.PRODUCT_ID) AS PART_NUMBER
        nvl((
            select distinct
                nvl(acc.part_number, '-')
            from
                xxeba_sales_acc_products acc
            where
                    acc.customer_id = c.id
                and acc.product_id = op.product_id
        ),
            '-')        as part_number
    from
        xxeba_sales_order            so,
        xxeba_order_products         op,
        eba_sales_customers          c,
        eba_sales_customer_locations cl
---XXEBA_SALES_ACC_PRODUCTS ACC
    where
            so.customer_id = c.id
        and so.order_id = op.order_id
        and so.billing_location = cl.id
---AND ACC.CUSTOMER_ID = C.ID
---AND ACC.PRODUCT_ID = OP.PRODUCT_ID
        and so.status = 'Y'
        and op.status = 'Y'
        and so.updated_in_tally = 'N'
        and so.order_date >= to_date('01-Jan-2025', 'DD-Mon-YYYY')
    order by
        so.order_id,
        op.order_products_id;


-- sqlcl_snapshot {"hash":"cd12dcc783396f21576bd4de48c81f783da737e5","type":"VIEW","name":"CRM_SALES_ORDERS_V","schemaName":"XXVENTURI","sxml":""}