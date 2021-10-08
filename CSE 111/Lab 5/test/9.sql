select count(distinct p_name) from parts
where s_nationkey is 'UNITED STATES' and limit(ps_supplycost * ps_availqty);
