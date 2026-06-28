begin
    dbms_scheduler.create_job(
        job_name            => '"XXVENTURI"."DAILY_TRANS_SUMMARY_7PM"',
        job_type            => 'PLSQL_BLOCK',
        job_action          => 'BEGIN
    XXEBS_MSK_SALES_SCHEDULER_PKG.XXEBA_DAILY_TRANS_SUMMARY(2501,''VENTURI TOOLS'');
END;
',
        start_date          => timestamp '2018-10-16 09:26:25.25776',
        repeat_interval     => 'FREQ=DAILY;BYTIME=190000;BYDAY=MON,TUE,WED,THU,FRI,SAT',
        end_date            => null,
        job_class           => 'DEFAULT_JOB_CLASS',
        comments            => 'DAILY_TRANS_SUMMARY_7PM',
        auto_drop           => false,
        number_of_arguments => 0
    );

    dbms_scheduler.set_attribute(
        name      => '"XXVENTURI"."DAILY_TRANS_SUMMARY_7PM"',
        attribute => 'logging_level',
        value     => dbms_scheduler.logging_off
    );

    dbms_scheduler.set_attribute(
        name      => '"XXVENTURI"."DAILY_TRANS_SUMMARY_7PM"',
        attribute => 'job_priority',
        value     => 3
    );

    dbms_scheduler.enable('"XXVENTURI"."DAILY_TRANS_SUMMARY_7PM"');
end;
/


-- sqlcl_snapshot {"hash":"05bee684a0ba46ad58fb867d8f0e3e4110e39eb3","type":"JOB","name":"DAILY_TRANS_SUMMARY_7PM","schemaName":"XXVENTURI","sxml":""}