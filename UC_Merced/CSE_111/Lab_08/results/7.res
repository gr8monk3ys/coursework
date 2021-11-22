QUERY PLAN
|--SEARCH TABLE customer USING COVERING INDEX customer_idx_c_name_c_custkey (c_name=?)
|--SEARCH TABLE orders USING COVERING INDEX orders_idx_o_custkey_o_orderkey (o_custkey=?)
|--SEARCH TABLE lineitem USING INDEX lineitem_idx_l_orderkey_l_suppkey (l_orderkey=?)
`--USE TEMP B-TREE FOR GROUP BY
1993-01|3
1993-02|4
1993-03|3
1993-06|1
1993-11|1
