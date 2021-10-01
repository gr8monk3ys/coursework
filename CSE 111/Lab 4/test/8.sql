select n_name, count(distinct o_orderkey) from orders, supplier
inner join nation on n_nationkey is s_nationkey
where strftime('%Y', o_orderdate) is '1995' and o_orderstatus is 'F'
group by n_name;
