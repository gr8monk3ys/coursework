.eqp on

select distinct n_name
from customer, nation, orders
where c_nationkey=n_nationkey and c_custkey=o_custkey
    and o_orderdate>='1996-09-10' and o_orderdate<='1996-09-12'
order by n_name;
