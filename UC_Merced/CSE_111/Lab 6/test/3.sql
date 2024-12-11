select count(results.p_partkey) from (select part.p_partkey from supplier
inner join partsupp on ps_suppkey is s_suppkey
inner join part on ps_partkey is p_partkey
inner join nation on n_nationkey is s_nationkey
where n_name is "UNITED STATES"
group by p_partkey having count(distinct s_suppkey) is 2) as results;
