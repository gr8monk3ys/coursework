select count(distinct s_suppkey) from supplier
inner join partsupp on ps_suppkey is s_suppkey
inner join part on ps_partkey is p_partkey
inner join nation on n_nationkey is s_nationkey
where p_retailprice is (select max(p_retailprice) from part);
