QUERY PLAN
|--SEARCH TABLE region USING COVERING INDEX region_idx_r_name_r_regionkey (r_name=?)
|--SEARCH TABLE nation USING COVERING INDEX nation_idx_n_regionkey_n_nationkey (n_regionkey=?)
`--SEARCH TABLE supplier USING INDEX supplier_idx_s_nationkey_s_acctbal (s_nationkey=? AND s_acctbal>?)
Supplier#000000071|8179.68
Supplier#000000021|9365.8
Supplier#000000091|6255.87
Supplier#000000013|9107.22
Supplier#000000001|5755.94
Supplier#000000008|7627.85
Supplier#000000019|6150.38
Supplier#000000055|7162.15
Supplier#000000049|9915.24
