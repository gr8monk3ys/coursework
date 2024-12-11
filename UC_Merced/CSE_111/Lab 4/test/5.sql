select c_name, count(o_orderkey) from nation
inner join orders on o_custkey is c_custkey
inner join customer on c_nationkey is n_nationkey
where n_name is 'GERMANY' and strftime('%Y', o_orderdate) is '1993'
group by c_name
order by c_name, count(o_orderkey);
