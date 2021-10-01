select count(distinct o_clerk) from orders, nation
inner join supplier on s_nationkey is n_nationkey
where n_name is 'UNITED STATES';
