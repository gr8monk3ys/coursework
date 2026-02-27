select s_name, p_size, min(ps_supplycost) from supplier
inner join partsupp on ps_suppkey is s_suppkey
inner join nation on s_nationkey is n_nationkey
inner join region on n_regionkey is r_regionkey
inner join part on ps_partkey is p_partkey
where r_name is 'ASIA' and p_type like '%STEEL%'
group by p_size
order by s_name, p_size;
