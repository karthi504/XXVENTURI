create or replace force editionable view xxventuri.crm_products_v (
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
        xxeba_sales_product_brands pb
    where
            p.product_family_id = pf.id
        and p.product_type_id = pt.product_type_id
        and p.brand_id = pb.brand_id
        and p.status = 'Y' 
-- AND P.BRAND_ID IN (1000,1001,1005,1028,1032,1033)
-- AND P.BRAND_ID NOT IN (1008,1027,1011,1006,1010,1012,1014,1031,1015,1023,1016)  
    order by
        1,
        2;


-- sqlcl_snapshot {"hash":"dcaf46c61c45513f8f7525abd6d1814923d9a13f","type":"VIEW","name":"CRM_PRODUCTS_V","schemaName":"XXVENTURI","sxml":""}