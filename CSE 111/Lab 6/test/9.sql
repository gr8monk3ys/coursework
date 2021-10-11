select distinct p_name from supplier, nation as asna, region as asre, nation as amcna, region as amcre
inner join lineitem on l_suppkey is s_suppkey
inner join orders on o_orderkey is l_orderkey
inner join customer on c_custkey is o_custkey
inner join part on p_partkey is l_partkey
where c_nationkey is amcna.n_nationkey and amcna.n_regionkey is amcre.r_regionkey
and s_nationkey is asna.n_nationkey and asna.n_regionkey is asre.r_regionkey
and amcre.r_name is 'AMERICA'
and asre.r_name is 'ASIA'
group by p_name having count(s_suppkey) is 3;
