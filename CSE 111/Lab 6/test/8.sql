select count(distinct c_name) from orders
inner join customer on c_custkey is o_custkey
where o_orderkey not in (select distinct(o_orderkey) from lineitem 
inner join region on r_regionkey is n_regionkey
inner join nation on n_nationkey is s_nationkey
inner join supplier on s_suppkey is l_suppkey
inner join orders on o_orderkey is l_orderkey
where r_name NOT in ('AMERICA'));