begin
    dbms_scheduler.create_job(
        job_name            => '"XXVENTURI"."AWS_NEW_SALESDATA_SYNC_TALLY_15MIN"',
        job_type            => 'PLSQL_BLOCK',
        job_action          => '
      BEGIN 
        AWS_NEW_SALESDATA_SYNC_TALLY; 
      END;
    ',
        start_date          => timestamp '2022-11-14 12:30:18.355183',
        repeat_interval     => 'FREQ=MINUTELY;INTERVAL=10;BYDAY=MON,TUE,WED,THU,FRI,SAT',
        end_date            => null,
        job_class           => 'DEFAULT_JOB_CLASS',
        comments            => 'AWS_NEW_SALESDATA_SYNC_TALLY_15MIN',
        auto_drop           => true,
        number_of_arguments => 0
    );

    dbms_scheduler.set_attribute(
        name      => '"XXVENTURI"."AWS_NEW_SALESDATA_SYNC_TALLY_15MIN"',
        attribute => 'logging_level',
        value     => dbms_scheduler.logging_off
    );

    dbms_scheduler.set_attribute(
        name      => '"XXVENTURI"."AWS_NEW_SALESDATA_SYNC_TALLY_15MIN"',
        attribute => 'job_priority',
        value     => 3
    );

end;
/


-- sqlcl_snapshot {"hash":"a40f07ff158ba55b14487c4789e267b25f3363cd","type":"JOB","name":"AWS_NEW_SALESDATA_SYNC_TALLY_15MIN","schemaName":"XXVENTURI","sxml":""}