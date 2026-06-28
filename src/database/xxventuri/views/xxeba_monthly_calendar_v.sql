create or replace force editionable view xxventuri.xxeba_monthly_calendar_v (
    serial_number,
    year_month,
    month,
    year,
    period
) as
    select
        serial_number,
        year_month,
        month,
        year,
        period
    from
        (
            with report_period as (
                select
                    add_months(
                        trunc(sysdate, 'MM'),
                        -5
                    )       start_date,
                    sysdate end_date
                from
                    dual
            )
            select
                rownum as serial_number,
                to_number(to_char(
                    add_months(
                        trunc(start_date, 'mm'),
                        level - 1
                    ),
                    'YYYYMM'
                ))     year_month,
                to_char(
                    add_months(
                        trunc(start_date, 'mm'),
                        level - 1
                    ),
                    'Mon'
                )      month,
                to_char(
                    add_months(
                        trunc(start_date, 'mm'),
                        level - 1
                    ),
                    'yyyy'
                )      year,
                to_char(
                    add_months(
                        trunc(start_date, 'mm'),
                        level - 1
                    ),
                    'Mon-yyyy'
                )      period
            from
                report_period
            connect by
                trunc(end_date, 'mm') >= add_months(
                    trunc(start_date, 'mm'),
                    level - 1
                )
        );


-- sqlcl_snapshot {"hash":"94036297dd76d55aa12aef9fadc370a0343469fc","type":"VIEW","name":"XXEBA_MONTHLY_CALENDAR_V","schemaName":"XXVENTURI","sxml":""}