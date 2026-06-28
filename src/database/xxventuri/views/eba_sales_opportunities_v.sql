create or replace force editionable view xxventuri.eba_sales_opportunities_v (
    id,
    row_key,
    customer_id,
    customer_name,
    rep_name,
    deal_name,
    deal_close_date,
    deal_close_date_alt,
    deal_amount,
    deal_probability,
    status_code,
    is_open,
    is_overdue,
    weighted_forecast,
    notes,
    products,
    last_changed,
    svp,
    territory_name,
    qtr,
    tags,
    customer_tags
) as
    select
        d.id,
        d.row_key,
        c.id                                     customer_id,
        c.customer_name,
        s.rep_last_name
        || ', '
        || s.rep_first_name                      as rep_name,
        d.deal_name,
        d.deal_close_date,
        d.deal_close_date_alt,
        d.deal_amount,
        d.deal_probability,
        sc.status_code,
        case
            when d.deal_probability is null
                 or d.deal_probability in ( 0, 100 ) then
                'No'
            else
                'Yes'
        end                                      is_open,
        case
            when d.deal_probability in ( 0, 100 ) then
                'No'
            when greatest(sysdate, d.deal_close_date) = sysdate then
                'Yes'
            else
                'No'
        end                                      is_overdue,
        d.deal_amount * d.deal_probability / 100 weighted_forecast,
        (
            select
                count(*)
            from
                eba_sales_comments
            where
                deal_id = d.id
        )                                        notes,
        (
            select
                count(*)
            from
                eba_sales_deal_products
            where
                deal_id = d.id
        )                                        products,
        nvl(d.updated, d.created)                last_changed,
        (
            select
                svp_name
            from
                eba_sales_svps svp
            where
                svp.id = d.svp_id
        )                                        svp,
        t.territory_name,
        d.qtr,
        d.tags,
        c.tags                                   customer_tags
    from
             eba_sales_deals d
        join eba_sales_customers         c on c.id = d.customer_id
        left join eba_sales_salesreps         s on s.id = d.salesrep_id_01
        left join eba_sales_deal_status_codes sc on sc.id = d.deal_status_code_id
        left join eba_sales_territories       t on t.id = c.customer_territory_id;


-- sqlcl_snapshot {"hash":"40dda117145667fad71682ce05f06c4fefc62b49","type":"VIEW","name":"EBA_SALES_OPPORTUNITIES_V","schemaName":"XXVENTURI","sxml":""}