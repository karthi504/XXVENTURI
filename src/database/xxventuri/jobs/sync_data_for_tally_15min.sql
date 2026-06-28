begin
    dbms_scheduler.create_job(
        job_name            => '"XXVENTURI"."SYNC_DATA_FOR_TALLY_15MIN"',
        job_type            => 'PLSQL_BLOCK',
        job_action          => 'BEGIN
  SYNC_SALESDATA_FOR_TALLY;
END;',
        start_date          => timestamp '2021-07-01 09:26:25.25776',
        repeat_interval     => 'FREQ=MINUTELY;INTERVAL=5',
        end_date            => null,
        job_class           => 'DEFAULT_JOB_CLASS',
        comments            => 'SYNC_DATA_FOR_TALLY_15MIN',
        auto_drop           => false,
        number_of_arguments => 0
    );

    dbms_scheduler.set_attribute(
        name      => '"XXVENTURI"."SYNC_DATA_FOR_TALLY_15MIN"',
        attribute => 'logging_level',
        value     => dbms_scheduler.logging_off
    );

    dbms_scheduler.set_attribute(
        name      => '"XXVENTURI"."SYNC_DATA_FOR_TALLY_15MIN"',
        attribute => 'job_priority',
        value     => 3
    );

end;
/


-- sqlcl_snapshot {"hash":"cc9898718f4602a52408a71b7751b8f25b156d4c","type":"JOB","name":"SYNC_DATA_FOR_TALLY_15MIN","schemaName":"XXVENTURI","sxml":""}