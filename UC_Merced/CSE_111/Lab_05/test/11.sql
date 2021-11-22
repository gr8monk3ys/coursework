select disctinct p1.p_name from lineitem, orders, part as p1,
(
    select p2.p_partkey, min(l_extendedprice*(1-l_discount)) as lowvalue
    from lineitem, orders,part as p2
    where l_orderkey is o_orderkey and l_partkey is p2.p_partkey
    and strftime('%Y-%m-%d', o_orderdate) > '1996-10-02'
)as minvalueitem
where l_orderkey is o_orderkey and l_partkey is p1.p_partkey
and strftime('%Y-%m-%d', o_orderdate) > '1996-10-02'
and p1.p_partkey is minvalueitem.p_partkey;
