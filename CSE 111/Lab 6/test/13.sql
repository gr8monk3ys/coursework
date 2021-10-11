select n_name, total(l_extendedprice) as totalPrice
from nation, customer, orders, lineitem
where c_nationkey is n_nationkey and c_custkey is o_custkey 
and o_orderkey is l_orderkey and strftime('%Y', l_shipdate) is '1994'
group by n_name
order by totalPrice desc;
