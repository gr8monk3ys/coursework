.eqp on

select count(o_orderkey)
from orders, customer, nation
where c_custkey=o_custkey
    and c_nationkey=n_nationkey
    and n_name='BRAZIL'
    and o_orderpriority='1-URGENT'
    and o_orderdate >= '1994-01-01' and o_orderdate <= '1997-12-31';
