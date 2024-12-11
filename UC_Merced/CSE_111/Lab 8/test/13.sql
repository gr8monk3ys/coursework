.eqp on

select sum(c_acctbal)
from customer, region, nation
where c_nationkey = n_nationkey
    and n_regionkey = r_regionkey
    and r_name = 'EUROPE'
    and c_mktsegment = 'MACHINERY';
