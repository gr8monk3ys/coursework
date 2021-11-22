with totalrevenue as 
(
    select sum((l_extendedprice * (1 - l_discount))) as total
    from region as totalcusregion, nation as totalsupnation, nation as totalcusnation, customer, supplier, lineitem, orders
    where c_nationkey is totalcusnation.n_nationkey and totalcusnation.n_regionkey is totalcusregion.r_regionkey and totalcusregion.r_name is 'ASIA'
    and s_nationkey is totalsupnation.n_nationkey
    and s_suppkey is l_suppkey and c_custkey is o_custkey and o_orderkey is l_orderkey
    and strftime('%Y', l_shipdate) is '1997'
)
select round((sum((unlineitem.l_extendedprice * (1 - unlineitem.l_discount))) / totalrevenue.total), 17)
from region as cusregion, nation as cusnation, nation as supnation, customer as asiacustomer, supplier as unsupplier, lineitem as unlineitem, orders as asiaorders
,totalrevenue
where asiacustomer.c_nationkey is cusnation.n_nationkey and cusnation.n_regionkey is cusregion.r_regionkey and cusregion.r_name is 'ASIA'
and unsupplier.s_nationkey is supnation.n_nationkey and supnation.n_name is 'UNITED STATES'
and unsupplier.s_suppkey is unlineitem.l_suppkey and asiacustomer.c_custkey is asiaorders.o_custkey and asiaorders.o_orderkey is unlineitem.l_orderkey
and strftime('%Y', unlineitem.l_shipdate) is '1997';
