create or replace force editionable view xxventuri.crm_products_stock_cost_v (
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
    qty_in_stock,
    tax_percentage,
    created_by,
    created,
    updated_by,
    updated
) as
    select
        p.row_key         as product_id,
        p.catalogue_no    as product_code,
        p.product_name    as product_name,
        p.product_sku     as hsn_code,
        (
            select
                brand_name
            from
                xxeba_sales_product_brands
            where
                brand_id = p.brand_id
        )                 as product_brand,
        pf.product_family as sub_group,
        (
            select
                unit_name
            from
                xxeba_sales_units
            where
                unit_id = p.unit_of_measure
        )                 as uom,
        pt.product_type   as sku_category,
        'N'               as has_batch,
        'N'               as has_mfg_dt,
        'N'               as has_exp_dt,
        p.product_cost    as std_cost_price,
        p.product_price   as std_selling_price,
        p.id              as unique_id,
        t.qty_in_stock,
        nvl((
            select
                tax_percent
            from
                xxeba_product_class
            where
                id = p.product_class_id
        ), 0)             as tax_percentage,
        p.created_by,
        p.created,
        p.updated_by,
        p.updated
    from
        eba_sales_products         p,
        eba_sales_product_families pf,
        xxeba_sales_product_types  pt,
        xxeba_sales_product_brands pb,
        xxeba_tally_stock_t        t
    where
            p.product_family_id = pf.id
        and p.product_type_id = pt.product_type_id
        and p.brand_id = pb.brand_id
        and p.status = 'Y'
        and p.row_key = t.product_code (+)
        and t.batch_sequence = (
            select
                max(batch_sequence)
            from
                xxeba_tally_stock_t
        )
        and t.qty_in_stock > 0
    order by
        1,
        2;


-- sqlcl_snapshot {"hash":"91382a76a6f8262a1c420824287c8ebaadb3ee11","type":"VIEW","name":"CRM_PRODUCTS_STOCK_COST_V","schemaName":"XXVENTURI","sxml":""}