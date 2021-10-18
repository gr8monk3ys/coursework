select distinct p_name from customer, region
inner join part on p_partkey is l_partkey
inner join lineitem on l_orderkey is o_orderkey
inner join orders on o_custkey is c_custkey
inner join nation on n_regionkey is r_regionkey
where r_name is 'AMERICA' and p_name in(select p_name from supplier 
inner join part on p_partkey is l_partkey
inner join lineitem on l_suppkey is s_suppkey
inner join nation on n_nationkey is s_nationkey
inner join region on r_regionkey is n_regionkey
where r_name is 'ASIA'
GROUP BY p_name
HAVING COUNT(s_suppkey) is 3)
ORDER BY p_name;