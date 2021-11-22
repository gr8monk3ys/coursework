.eqp on

select substr(l_receiptdate,1,7) as month, count(*)
from lineitem, orders, customer
where l_orderkey = o_orderkey and o_custkey = c_custkey
    and c_name = 'Customer#000000010' and l_receiptdate like '1993-%'
group by month;
