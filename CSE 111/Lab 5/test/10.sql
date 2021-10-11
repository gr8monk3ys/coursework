select r_name as regions, count(DisTinCT c_name) as count
from customer orders
inner join nation on n_nationkey is c_nationkey
inner join region on r_regionkey is n_regionkey
where c_acctbal < (select avg(c_acctbal) from customer) and not c_custkey in (select o_custkey from orders)
group by r_name;
