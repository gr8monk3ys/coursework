select r_name, count(s_suppkey) from supplier 
inner join nation on s_nationkey = n_nationkey
inner join region on n_regionkey = r_regionkey
inner join(select r_name as inner_r_name, avg(s_acctbal) as r_avg_acctbacl from supplier
inner join nation on s_nationkey = n_nationkey
inner join region on n_regionkey = r_regionkey
group by r_name) as avg_table on avg_table.inner_r_name = r_name
where s_acctbal < avg_table.r_avg_acctbacl
group by r_name;
