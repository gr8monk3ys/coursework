select n_name, MAX(s_acctbal) from region
inner join supplier on s_nationkey is n_nationkey
inner join nation on n_regionkey is r_regionkey
where s_acctbal > 9000
group by n_name;
