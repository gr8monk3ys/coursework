with lessThan as
(
    select s_suppkey from nation
    inner join supplier on s_suppkey is l_suppkey
    inner join lineitem on l_orderkey is o_orderkey
    inner join customer on c_nationkey is n_nationkey
    inner join orders on o_custkey is c_custkey
    where n_name in ('GERMANY', 'FRANCE')
    group by s_suppkey
    HAVING count(distinct o_orderkey) < 50
)
select count(*)
from lessThan;
