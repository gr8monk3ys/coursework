select region_1.r_name, region_2.r_name, max(o_totalprice) from supplier, 
    nation as nation_1,
    region as region_1,
    nation as nation_2,
    region as region_2

inner join customer on c_custkey is o_custkey
inner join orders on o_orderkey is l_orderkey
inner join lineitem on l_suppkey is s_suppkey
where s_nationkey is nation_1.n_nationkey and nation_1.n_regionkey is region_1.r_regionkey
and c_nationkey is nation_2.n_nationkey and nation_2.n_regionkey is region_2.r_regionkey
group by region_1.r_name, region_2.r_name;
