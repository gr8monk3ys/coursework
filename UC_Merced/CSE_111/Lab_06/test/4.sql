select count(results.s_suppkey)
from (select s_suppkey from supplier
inner join partsupp on ps_suppkey is s_suppkey
inner join part on ps_partkey is p_partkey
inner join nation on n_nationkey is s_nationkey
where n_name is "UNITED STATES"
group by s_suppkey having count(distinct p_partkey) >= 40) as results;