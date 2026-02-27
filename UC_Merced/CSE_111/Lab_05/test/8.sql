select count(distinct s_name) from supplier
inner join partsupp on s_suppkey is ps_suppkey
inner join part on p_partkey is ps_partkey
where p_type like '%POLISHED%' and p_size in (3, 23, 36, 49);
