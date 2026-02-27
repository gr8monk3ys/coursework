select n_name, count(o_orderkey) from orders
inner join region on r_regionkey is n_regionkey
inner join nation on n_nationkey is c_nationkey
inner join customer on c_custkey is o_custkey
where r_name is 'AMERICA'
group by n_name;
