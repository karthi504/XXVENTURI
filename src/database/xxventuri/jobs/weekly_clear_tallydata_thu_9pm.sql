begin
    dbms_scheduler.create_job(
        job_name            => '"XXVENTURI"."WEEKLY_CLEAR_TALLYDATA_THU_9PM"',
        job_type            => 'PLSQL_BLOCK',
        job_action          => 'BEGIN
  XXEBS_SALES_SECURITY_PKG.CLEAR_TALLY_RECORDS();
END;',
        start_date          => timestamp '2019-08-27 14:13:19.0',
        repeat_interval     => 'FREQ=WEEKLY;BYTIME=210000;BYDAY=THU',
        end_date            => null,
        job_class           => 'DEFAULT_JOB_CLASS',
        comments            => 'WEEKLY_CLEAR_TALLYDATA_THU_9PM',
        auto_drop           => false,
        number_of_arguments => 0
    );

    dbms_scheduler.set_attribute(
        name      => '"XXVENTURI"."WEEKLY_CLEAR_TALLYDATA_THU_9PM"',
        attribute => 'logging_level',
        value     => dbms_scheduler.logging_off
    );

    dbms_scheduler.set_attribute(
        name      => '"XXVENTURI"."WEEKLY_CLEAR_TALLYDATA_THU_9PM"',
        attribute => 'job_priority',
        value     => 3
    );

    dbms_scheduler.enable('"XXVENTURI"."WEEKLY_CLEAR_TALLYDATA_THU_9PM"');
end;
/


-- sqlcl_snapshot {"hash":"1aa780b31812a050a19036313fc75a29bd741524","type":"JOB","name":"WEEKLY_CLEAR_TALLYDATA_THU_9PM","schemaName":"XXVENTURI","sxml":""}