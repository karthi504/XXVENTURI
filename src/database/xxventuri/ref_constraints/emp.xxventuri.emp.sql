alter table xxventuri.emp
    add
        foreign key ( mgr )
            references xxventuri.emp ( empno )
        enable;


-- sqlcl_snapshot {"hash":"9b0aef6d6e42655db0f70757fcd0bc01a43ee6e4","type":"REF_CONSTRAINT","name":"EMP.XXVENTURI.EMP","schemaName":"XXVENTURI","sxml":""}