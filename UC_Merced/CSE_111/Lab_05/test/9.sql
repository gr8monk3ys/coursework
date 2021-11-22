select p_name 
from part, supplier, nation, partsupp
where p_partkey is ps_partkey and ps_suppkey is s_suppkey
and s_nationkey is n_nationkey and n_name is 'UNITED STATES'
order by (ps_supplycost * ps_availqty) desc
limit (select count(distinct ps_partkey)/100
    from part, partsupp, supplier, nation
    where p_partkey is ps_partkey and ps_suppkey is s_suppkey
    and s_nationkey is n_nationkey and n_name is 'UNITED STATES');