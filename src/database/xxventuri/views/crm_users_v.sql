create or replace force editionable view xxventuri.crm_users_v (
    unique_id,
    staff_code,
    user_name,
    rep_last_name,
    rep_first_name,
    rep_email,
    row_key,
    created_by,
    created,
    updated_by,
    updated
) as
    select
        id      as unique_id,
        row_key as staff_code,
        user_name,
        rep_last_name,
        rep_first_name,
        rep_email,
        row_key,
        created_by,
        created,
        updated_by,
        updated
    from
        eba_sales_salesreps
    where
            user_name != 'admin'
        and status = 'Y'
    order by
        user_name;


-- sqlcl_snapshot {"hash":"cf33aab4097c27bfd0be861959f5af6a208da6c6","type":"VIEW","name":"CRM_USERS_V","schemaName":"XXVENTURI","sxml":""}