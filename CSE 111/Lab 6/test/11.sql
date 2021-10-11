with minCus as(
select n_name, count(c_custkey) as totalCus from nation
inner join customer on c_nationkey is n_nationkey
group by n_name
order by totalCus asc limit 1)

select minCus.n_name
from minCus;
