select total(ps_supplycost) from partsupp, part,supplier as s1, lineitem
where ps_partkey is p_partkey and ps_suppkey is s_suppkey and l_partkey is p_partkey
and p_retailprice < 1000
and strftime('%Y', l_shipdate) is '1997'
and not exists
(
    select *
    from supplier as s2, lineitem
    where l_suppkey is s2.s_suppkey 
    and s2.s_name is s1.s_name
    and l_extendedprice < 2000
    and strftime('%Y', l_shipdate) is '1996'
);
