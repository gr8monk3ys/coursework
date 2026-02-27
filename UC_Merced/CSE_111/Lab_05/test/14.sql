select supregion.r_name, cusregion.r_name, strftime('%Y', l_shipdate), total((l_extendedprice*(1-l_discount)))
from region as supregion, nation as supnation, region as cusregion, nation as cusnation, supplier, customer, lineitem, orders
where c_nationkey is cusnation.n_nationkey and cusnation.n_regionkey is cusregion.r_regionkey
and s_nationkey is supnation.n_nationkey and supnation.n_regionkey is supregion.r_regionkey
and s_suppkey is l_suppkey and c_custkey is o_custkey and o_orderkey is l_orderkey
and strftime('%Y', l_shipdate) between '1996' and '1997'
group by supregion.r_name, cusregion.r_name,strftime('%Y', l_shipdate);
