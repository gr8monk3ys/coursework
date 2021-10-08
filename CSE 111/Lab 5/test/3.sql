select min(l_discount) from lineitem
inner join orders on o_orderkey is l_orderkey
where(substr(o_orderdate, 1, 7) is '1996-10' and l_discount > 
(select avg(l_discount) from lineitem
inner join orders on o_orderkey is l_orderkey));
