select s_name, c_name, min(o_totalprice) from orders
inner join customer on c_custkey is o_custkey
inner join supplier on s_suppkey is l_suppkey
inner join lineitem on l_orderkey is o_orderkey
where o_orderstatus is 'F';
