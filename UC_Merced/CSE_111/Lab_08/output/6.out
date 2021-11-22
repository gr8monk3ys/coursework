QUERY PLAN
|--SEARCH TABLE orders USING INDEX orders_idx_o_orderdate (o_orderdate>? AND o_orderdate<?)
|--SEARCH TABLE customer USING INDEX customer_idx_c_custkey (c_custkey=?)
|--SEARCH TABLE nation USING COVERING INDEX nation_idx_n_nationkey_n_name (n_nationkey=?)
`--USE TEMP B-TREE FOR DISTINCT
CHINA
EGYPT
ETHIOPIA
INDONESIA
JORDAN
KENYA
MOROCCO
PERU
ROMANIA
RUSSIA
UNITED STATES
VIETNAM
