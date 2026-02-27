select n_name, Y from(select n_name, count(distinct l_orderkey) as Y from region
inner join supplier on s_nationkey is n_nationkey
inner join nation on n_regionkey is r_regionkey
inner join lineitem on l_suppkey is s_suppkey
inner join orders on o_orderkey is l_orderkey
where o_orderstatus is 'F' and o_orderdate between '1995-01-01' and '1995-12-31'
group by n_name) where Y > 50;
