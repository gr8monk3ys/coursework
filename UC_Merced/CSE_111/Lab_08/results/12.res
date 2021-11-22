QUERY PLAN
|--SEARCH TABLE orders USING INDEX orders_idx_o_orderstatus (o_orderstatus=?)
|--SEARCH TABLE customer USING INDEX customer_idx_c_custkey (c_custkey=?)
|--SEARCH TABLE nation USING INDEX nation_idx_n_nationkey_n_name (n_nationkey=?)
|--SEARCH TABLE region USING COVERING INDEX region_idx_r_regionkey_r_name (r_regionkey=?)
`--USE TEMP B-TREE FOR GROUP BY
AFRICA|1503
AMERICA|1425
ASIA|1423
EUROPE|1324
MIDDLE EAST|1629
