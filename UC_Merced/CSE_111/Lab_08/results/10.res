QUERY PLAN
|--SEARCH TABLE region USING COVERING INDEX region_idx_r_name_r_regionkey (r_name=?)
|--SEARCH TABLE nation USING COVERING INDEX nation_idx_n_regionkey_n_nationkey (n_regionkey=?)
|--SEARCH TABLE customer USING COVERING INDEX customer_idx_c_nationkey_c_custkey (c_nationkey=?)
`--SEARCH TABLE orders USING INDEX orders_idx_o_custkey_o_orderdate (o_custkey=? AND o_orderdate>? AND o_orderdate<?)
66322068.56
