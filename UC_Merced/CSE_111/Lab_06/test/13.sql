select n_name from(select n_name, sum(l_extendedprice) from nation
inner join supplier on s_nationkey is n_nationkey
inner join lineitem on l_suppkey is s_suppkey 
where l_shipdate like '1994%');
