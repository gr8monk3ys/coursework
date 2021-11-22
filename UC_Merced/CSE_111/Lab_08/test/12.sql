.eqp on

select r_name, count(*) as cnt_ord
from orders, customer, nation, region
where o_custkey=c_custkey
    and c_nationkey=n_nationkey
    and n_regionkey=r_regionkey
    and o_orderstatus='F'
group by r_name;

