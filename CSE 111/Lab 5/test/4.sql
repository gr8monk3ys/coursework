-- select n_name, count(c_custkey), count(s_suppkey)  from customer
-- inner join region on r_regionkey is n_regionkey
-- inner join nation on n_nationkey is s_nationkey
-- inner join supplier on s_nationkey is c_nationkey
-- where r_name is 'AFRICA'
-- group by n_name;

select cust_n_name, cust_counts, supp_counts from (select n_name as cust_n_name,
count(c_custkey) as cust_counts from customer
	inner join nation on c_nationkey is n_nationkey
	inner join region on n_regionkey is r_regionkey
	where r_name is 'AFRICA'
	group by n_name
)as t_cust_counts join(
	select n_name as supp_n_name,
	count(s_suppkey) as supp_counts from supplier
	inner join nation on s_nationkey is n_nationkey
	inner join region on n_regionkey is r_regionkey
	where r_name is 'AFRICA'
	group by n_name
) as t_supp_counts on cust_n_name is supp_n_name;
