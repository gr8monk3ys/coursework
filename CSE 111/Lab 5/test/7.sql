select o_orderpriority, count(p_partkey) from part
inner join lineitem on l_partkey is p_partkey
inner join orders on o_orderkey is l_orderkey
where strftime('%Y', o_orderdate) is '1997' and l_receiptdate > l_commitdate
group by o_orderpriority;