.eqp on

select s_name, s_acctbal
from supplier, nation, region
where n_regionkey=r_regionkey and s_nationkey=n_nationkey
    and r_name='AMERICA' and s_acctbal>5000;
