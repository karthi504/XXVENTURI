create or replace force editionable view xxventuri.eba_sales_opp_v (
    customer_id,
    deal_id,
    customer_name,
    customer_stock_symb,
    rep_first_name,
    rep_last_name,
    rep_email,
    deal_name,
    deal_close_date,
    deal_amount,
    deal_probability,
    status_code
) as
    select
        c.id customer_id,
        d.id deal_id,
        c.customer_name,
        c.customer_stock_symb,
        sr.rep_first_name,
        sr.rep_last_name,
        sr.rep_email,
        d.deal_name,
        d.deal_close_date,
        case
            when exists (
                select
                    null
                from
                    apex_application_build_options
                where
                        application_id = v('APP_ID')
                    and build_option_name = 'Opportunity Amount Set at Product Level'
                    and build_option_status = 'Exclude'
            ) then
                d.deal_amount
            else
                (
                    select
                        sum(nvl(quote_price, 0.00))
                    from
                        eba_sales_deal_products dp
                    where
                        dp.deal_id = d.id
                )
        end  as deal_amount,
        d.deal_probability,
        dsc.status_code
    from
             eba_sales_deals d
        join eba_sales_deal_status_codes dsc on dsc.id = d.deal_status_code_id
        join eba_sales_salesreps         sr on sr.id = d.salesrep_id_01
        join eba_sales_customers         c on c.id = d.customer_id;


-- sqlcl_snapshot {"hash":"843744b66ab8116f6db7cf7c139c9c69932226dc","type":"VIEW","name":"EBA_SALES_OPP_V","schemaName":"XXVENTURI","sxml":""}