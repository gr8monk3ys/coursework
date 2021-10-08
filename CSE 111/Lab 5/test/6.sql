select p_mfgr from part, supplier
inner join partsupp on ps_partkey is p_partkey
where ps_availqty is (select max(ps_availqty) from partsupp
where s_name is '%000000010%');
