-- select p_name from part, nation
-- inner join partsupp on ps_partkey is p_partkey
-- where n_name is 'UNITED STATES'
-- group by p_name
-- limit(ps_supplycost * ps_availqty);


select (ps_supplycost * ps_availqty) as total from partsupp
limit 1;