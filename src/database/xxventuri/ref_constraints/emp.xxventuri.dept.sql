alter table xxventuri.emp
    add
        foreign key ( deptno )
            references xxventuri.dept ( deptno )
        enable;


-- sqlcl_snapshot {"hash":"985fdb954611470e3b036964ed8fce920723b8c2","type":"REF_CONSTRAINT","name":"EMP.XXVENTURI.DEPT","schemaName":"XXVENTURI","sxml":""}