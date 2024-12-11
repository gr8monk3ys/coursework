.eqp on

select count(distinct o_custkey)
from lineitem, orders
where l_orderkey = o_orderkey and l_discount >= 0.1;
