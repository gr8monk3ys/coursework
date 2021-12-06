create trigger t2 after update on customer
begin
    update customer set c_comment = "Negative balance!!!"
    where NEW.c_acctbal < 0 and OLD.c_acctbal > 0;
end;

update customer set c_acctbal = -100
where c_nationkey in (select n_nationkey from nation, region
where n_regionkey = r_regionkey and r_name = 'AMERICA');

select count(c_custkey) from customer, nation
where c_acctbal < 0 and c_nationkey = n_nationkey and n_name = 'CANADA';