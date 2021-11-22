select n_name, o_orderstatus, count(o_orderkey) from region
inner join nation on n_regionkey is r_regionkey
inner join customer on c_nationkey is n_nationkey
inner join orders on o_custkey is c_custkey
where r_name is 'AMERICA'
group by n_name, o_orderstatus;
