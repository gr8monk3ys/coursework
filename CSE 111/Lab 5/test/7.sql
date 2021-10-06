select o_orderpriority, count(p_partkey)
where strftime('%Y', o_orderdate) is '1997' and l_receiptdate > l_commitdate;
