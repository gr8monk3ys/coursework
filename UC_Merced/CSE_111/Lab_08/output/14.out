QUERY PLAN
|--SEARCH TABLE orders USING INDEX orders_idx_o_orderpriority_o_orderdate (o_orderpriority=? AND o_orderdate>? AND o_orderdate<?)
|--SEARCH TABLE nation USING INDEX nation_idx_n_name (n_name=?)
`--SEARCH TABLE customer USING COVERING INDEX customer_idx_c_nationkey_c_custkey (c_nationkey=? AND c_custkey=?)
86
