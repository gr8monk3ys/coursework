select customer.c_name, SUM(orders.o_totalprice) from orders
inner join nation on nation.n_nationkey is customer.c_nationkey
inner join customer on customer.c_custkey is orders.o_custkey
where nation.n_name is 'FRANCE' and strftime('%Y', o_orderdate) is '1995'
group by customer.c_name;
