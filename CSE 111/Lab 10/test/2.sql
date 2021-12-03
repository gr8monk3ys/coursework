create trigger negative_balance before delete or insert or update on customer
for each row 
when (c_acctbal < 0)
begin
update customer set comment = 'Negative balance !!! Add money now';
end

create trigger positive_balance before delete or insert or update on customer
for each row 
when (c_acctbal > 0)
begin
update customer set comment = ' ';
update customer set c_acctbal = -200 where continent='ASIA';
select * from customer where c_acctbal<0 AND country='CHINA';
update customer set c_acctbal = 100 where country='CHINA';
select * from customer where c_acctbal<0 AND continent='ASIA';
end