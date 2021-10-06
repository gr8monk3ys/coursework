select min(l_discount) from lineitem
where o_orderdate between '09-01-1996' and '09-31-1996' 
and l_discount > (select avg(l_discount) from lineitem);