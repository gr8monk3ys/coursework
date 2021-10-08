select r_name, count(distinct c_custkey) from customer
inner join nation on n_nationkey is c_nationkey
inner join region on r_regionkey is n_regionkey
inner join orders on o_custkey is c_custkey
where c_acctbal < (select avg(c_acctbal) from customer)
-- and c_custkey in (select o_custkey from orders)
group by r_name;

