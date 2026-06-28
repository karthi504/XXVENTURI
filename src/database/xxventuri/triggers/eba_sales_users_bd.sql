create or replace editionable trigger xxventuri.eba_sales_users_bd before
    delete on xxventuri.eba_sales_users
    for each row
declare
    pragma autonomous_transaction;
begin
    -- Disallow deletes to a user's own record unless last one.
    if v('APP_USER') = upper(:old.username) then
        for c1 in (
            select
                count(*) cnt
            from
                eba_sales_users
            where
                id != :old.id
        ) loop
            if c1.cnt > 0 then
                raise_application_error(-20002, 'Delete disallowed, you cannot delete your own access control details.');
            end if;
        end loop;

    end if;
end;
/

alter trigger xxventuri.eba_sales_users_bd enable;


-- sqlcl_snapshot {"hash":"44f1b6d16f63950a38ebc8800a8ca36f7eaea3e1","type":"TRIGGER","name":"EBA_SALES_USERS_BD","schemaName":"XXVENTURI","sxml":""}