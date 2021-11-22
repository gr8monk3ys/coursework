select r_name, s_name, m_acctbal from supplier, nation, region,
(select r_name as m_name, MAX(s_acctbal) as m_acctbal 
from supplier, nation, region on (s_nationkey is n_nationkey and n_regionkey is r_regionkey) 
group by r_name) 
on (s_nationkey is n_nationkey and n_regionkey is r_regionkey and r_name is m_name 
and s_acctbal is m_acctbal) 
order by r_name;
