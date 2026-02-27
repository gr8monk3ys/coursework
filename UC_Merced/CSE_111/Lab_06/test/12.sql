with minPrice as(
select n_name, sum(o_totalprice) as totalPrice from nation
inner join customer on c_nationkey is n_nationkey
inner join orders on o_custkey is c_custkey
group by n_name
order by totalPrice asc limit 1)

select minPrice.n_name
from minPrice;
