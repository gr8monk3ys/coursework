select s_name, o_orderpriority, count(distinct p_partkey) from orders
inner join nation on n_nationkey is s_nationkey
inner join region on r_regionkey is n_regionkey
inner join supplier on s_suppkey is l_suppkey
inner join part on p_partkey is l_partkey
inner join lineitem on l_orderkey is o_orderkey
where n_name = 'CANADA'
group by s_name, o_orderpriority;
