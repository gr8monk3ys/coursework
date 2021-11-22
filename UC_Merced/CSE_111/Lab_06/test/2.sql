select count(results.c_custkey) from (select customer.c_custkey from customer
inner join orders on customer.c_custkey is orders.o_custkey
where strftime("%Y-%m", orders.o_orderdate) is "1995-11"
group by customer.c_custkey
having count(customer.c_custkey) >= 3) as results;
