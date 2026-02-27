select p_mfgr from part
inner join partsupp on ps_partkey is p_partkey
inner join supplier on s_suppkey is ps_suppkey
where ps_availqty is (select min(ps_availqty) from partsupp
inner join supplier on s_suppkey is ps_suppkey
where s_name is 'Supplier#000000010')
group by ps_availqty;