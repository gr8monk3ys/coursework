.eqp on

select substr(o_orderdate, 1, 4) as year, count(*)
from orders, nation, supplier, lineitem
where l_orderkey = o_orderkey
    and l_suppkey = s_suppkey
    and n_nationkey = s_nationkey
    and o_orderpriority='3-MEDIUM'
    and n_name = 'CANADA'
group by year;
