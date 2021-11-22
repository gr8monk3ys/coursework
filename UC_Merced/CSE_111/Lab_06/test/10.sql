with smallAmount as(
select r_name from region
inner join customer on c_nationkey is s_nationkey
inner join supplier on s_nationkey is n_nationkey
inner join nation on n_regionkey is r_regionkey
inner join lineitem on l_suppkey is s_suppkey
where l_extendedprice is (select min(l_extendedprice) from lineitem))

select distinct smallAmount.r_name
from smallAmount;