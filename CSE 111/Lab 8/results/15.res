QUERY PLAN
|--SEARCH TABLE orders USING INDEX orders_idx_o_orderpriority_o_orderkey (o_orderpriority=?)
|--SEARCH TABLE nation USING INDEX nation_idx_n_name (n_name=?)
|--SEARCH TABLE supplier USING COVERING INDEX supplier_idx_s_nationkey_s_suppkey (s_nationkey=?)
|--SEARCH TABLE lineitem USING COVERING INDEX lineitem_idx_l_orderkey_l_suppkey (l_orderkey=? AND l_suppkey=?)
`--USE TEMP B-TREE FOR GROUP BY
1992|55
1993|57
1994|48
1995|55
1996|53
1997|59
1998|38
