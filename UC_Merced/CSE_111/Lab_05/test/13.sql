select o_orderpriority, count(distinct o_orderkey) from orders, lineitem
where o_orderkey is l_orderkey and ((strftime('%m', o_orderdate) + 2)/ 3) is 4
and strftime('%Y', o_orderdate) is '1997'
and strftime('%Y-%m-%d', l_commitdate) > strftime('%Y-%m-%d', l_receiptdate)
group by o_orderpriority;
