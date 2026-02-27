.eqp on

select n_name, count(*) as cnt, max(s_acctbal)
from supplier, nation 
where s_nationkey = n_nationkey
group by n_name
having cnt > 5;
