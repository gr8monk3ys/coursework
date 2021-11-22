select r_name, count(s_suppkey) from region
inner join nation on n_regionkey is r_regionkey
inner join supplier on s_nationkey is n_nationkey
group by r_name;
