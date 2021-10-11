select distinct c_name from region, orders
inner join supplier on s_nationkey is n_nationkey
inner join nation on n_regionkey is r_regionkey
inner join customer on c_custkey is o_custkey
where r_name is 'AMERICA'
group by c_name
having count(o_orderkey) >= 1;
