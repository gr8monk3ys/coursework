.eqp on

select c_mktsegment, min(c_acctbal) as min, max(c_acctbal) as max, sum(c_acctbal) as total
from customer
group by c_mktsegment;
