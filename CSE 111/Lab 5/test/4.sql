select n_name, count(c_custkey), count(s_suppkey)  from customer
inner join region on r_regionkey is n_regionkey
inner join nation on n_nationkey is s_nationkey
inner join supplier on s_nationkey is c_nationkey
where r_name is 'AFRICA'
group by n_name;
