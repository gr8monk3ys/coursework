drop trigger if exists t3;

create trigger t3 after update on customer
begin
update customer
set c_comment = "Positive balance"
where NEW.c_acctbal > 0
and OLD.c_acctbal < 0;
end;

update customer set c_acctbal = 100
where c_nationkey in (select n_nationkey from nation
where n_name = 'UNITED STATES');

select count(c_custkey) from region
inner join customer on c_nationkey = n_nationkey
inner join nation on n_regionkey = r_regionkey
where c_acctbal < 0 and r_name = 'AMERICA';