select n_name, count(o_orderkey) from orders, region, nation
where r_name is 'AMERICA'
group by n_name;