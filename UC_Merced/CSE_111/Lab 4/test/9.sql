select count(distinct o_clerk) from nation
inner join orders on o_orderkey is l_orderkey
inner join lineitem on l_suppkey is s_suppkey
inner join supplier on s_nationkey is n_nationkey
where n_name is 'UNITED STATES'
