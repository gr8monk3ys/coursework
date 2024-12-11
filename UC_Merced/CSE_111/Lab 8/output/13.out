QUERY PLAN
|--SEARCH TABLE customer USING INDEX customer_idx_c_mktsegment (c_mktsegment=?)
|--SEARCH TABLE region USING COVERING INDEX region_idx_r_name_r_regionkey (r_name=?)
`--SEARCH TABLE nation USING COVERING INDEX nation_idx_n_regionkey_n_nationkey (n_regionkey=? AND n_nationkey=?)
172603.51
