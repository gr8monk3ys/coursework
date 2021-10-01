select c_name, count(orders) from customer, orders, nation
where n_name is 'GERMANY' and o_orderdate between '1993-00-00' and '1994-00-00'
order by c_name; 
