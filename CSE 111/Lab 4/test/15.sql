select count(distinct orders.o_orderkey) from orders
inner join customer on orders.o_custkey is customer.c_custkey
inner join supplier on lineitem.l_suppkey is supplier.s_suppkey
inner join lineitem on orders.o_orderkey is lineitem.l_orderkey
where customer.c_acctbal > 0 and supplier.s_acctbal < 0;
