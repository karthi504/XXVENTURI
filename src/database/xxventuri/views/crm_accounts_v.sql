create or replace force editionable view xxventuri.crm_accounts_v (
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
    credit_limit_rec,
    created_by,
    created,
    updated_by,
    updated
) as
    select
        id      as unique_id,
        row_key as customer_id,
        customer_name,
        gst_no,
        credit_terms_rec,
        contact_id,
        (
            select
                contact_name
            from
                eba_sales_customer_contacts
            where
                id = contact_id
        )       as contact_name,
        (
            select
                contact_email
            from
                eba_sales_customer_contacts
            where
                id = contact_id
        )       as contact_email,
        (
            select
                contact_phone
            from
                eba_sales_customer_contacts
            where
                id = contact_id
        )       as contact_phone,
        (
            select
                contact_cell
            from
                eba_sales_customer_contacts
            where
                id = contact_id
        )       as contact_cell,
        (
            select
                bank_name
            from
                xxeba_sales_cust_banks
            where
                id = bank_id
        )       as bank_name,
        (
            select
                branch_location
            from
                xxeba_sales_cust_banks
            where
                id = bank_id
        )       as branch_location,
        (
            select
                account_number
            from
                xxeba_sales_cust_banks
            where
                id = bank_id
        )       as account_number,
        (
            select
                ifsc_code
            from
                xxeba_sales_cust_banks
            where
                id = bank_id
        )       as ifsc_code,
        staff_code,
        credit_limit_rec,
        created_by,
        created,
        updated_by,
        updated
    from
        (
            select
                c.id,
                c.customer_name,
                c.gst_no,
                cd.credit_terms_rec,
                c.row_key,
                cd.credit_limit_rec,
                c.created_by,
                c.created,
                c.updated_by,
                c.updated,
                (
                    select
                        s.row_key
                    from
                        eba_sales_salesreps s
                    where
                        s.id = c.default_rep_id
                )   as staff_code,
                case
                    when (
                        select
                            count(id)
                        from
                            eba_sales_customer_contacts
                        where
                                customer_id = c.id
                            and status = 'Y'
                    ) = 1 then
                        (
                            select
                                id
                            from
                                eba_sales_customer_contacts
                            where
                                    customer_id = c.id
                                and status = 'Y'
                        )
                    when (
                        select
                            count(id)
                        from
                            eba_sales_customer_contacts
                        where
                                customer_id = c.id
                            and key_contact = 'Y'
                            and status = 'Y'
                    ) = 1 then
                        (
                            select
                                id
                            from
                                eba_sales_customer_contacts
                            where
                                    customer_id = c.id
                                and key_contact = 'Y'
                                and status = 'Y'
                        )
                    else
                        null
                end as contact_id,
                case
                    when (
                        select
                            count(id)
                        from
                            xxeba_sales_cust_banks
                        where
                                customer_id = c.id
                            and status = 'Y'
                    ) = 1 then
                        (
                            select
                                id
                            from
                                xxeba_sales_cust_banks
                            where
                                    customer_id = c.id
                                and status = 'Y'
                        )
                    else
                        null
                end as bank_id
            from
                eba_sales_customers          c,
                xxeba_sales_customer_details cd
            where
                    c.id = cd.customer_id (+)
                and c.status != 'X'
        )
    order by
        2;


-- sqlcl_snapshot {"hash":"14275e810bed370b34fe5a1bffa1db03348d91bc","type":"VIEW","name":"CRM_ACCOUNTS_V","schemaName":"XXVENTURI","sxml":""}