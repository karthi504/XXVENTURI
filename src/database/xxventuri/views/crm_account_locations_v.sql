create or replace force editionable view xxventuri.crm_account_locations_v (
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
    city_name,
    created_by,
    created,
    updated_by,
    updated
) as
    select
        customer_name,
        id      as unique_id,
        row_key as customer_id,
        (
            select
                row_key
            from
                eba_sales_customer_locations
            where
                id = location_unique_id
        )       as location_id,
        (
            select
                customer_location_name
            from
                eba_sales_customer_locations
            where
                id = location_unique_id
        )       as customer_location_name,
        (
            select
                customer_address1
            from
                eba_sales_customer_locations
            where
                id = location_unique_id
        )       as customer_address1,
        (
            select
                customer_address2
            from
                eba_sales_customer_locations
            where
                id = location_unique_id
        )       as customer_address2,
        (
            select
                customer_postal_code
            from
                eba_sales_customer_locations
            where
                id = location_unique_id
        )       as customer_postal_code,
        (
            select
                c.country_name
            from
                eba_sales_customer_locations l,
                eba_sales_countries          c
            where
                    l.id = location_unique_id
                and l.country_id = c.id
        )       as country_name,
        (
            select
                state
            from
                eba_sales_customer_locations l,
                eba_sales_states             s
            where
                    l.id = location_unique_id
                and l.state_id = s.id
        )       as state_name,
        (
            select
                city_name
            from
                eba_sales_customer_locations l,
                xxeba_sales_cities_t         c
            where
                    l.id = location_unique_id
                and l.city_id = c.city_id
        )       as city_name,
        created_by,
        created,
        updated_by,
        updated
    from
        (
            select
                c.customer_name,
                c.id,
                c.row_key,
   /* CASE
      WHEN (SELECT COUNT(ID) FROM EBA_SALES_CUSTOMER_LOCATIONS WHERE CUSTOMER_ID=C.ID)= 1
      THEN  (SELECT ID FROM EBA_SALES_CUSTOMER_LOCATIONS WHERE CUSTOMER_ID=C.ID)
      ELSE NULL
    END*/
                cl.id as location_unique_id,
                cl.created_by,
                cl.created,
                cl.updated_by,
                cl.updated
            from
                eba_sales_customers          c,
                eba_sales_customer_locations cl
            where
                    c.status != 'X'
                and c.id = cl.customer_id
        )
    order by
        1,
        3;


-- sqlcl_snapshot {"hash":"9ab28ae7c61ca5b1c8cccdf42e66907022ded104","type":"VIEW","name":"CRM_ACCOUNT_LOCATIONS_V","schemaName":"XXVENTURI","sxml":""}