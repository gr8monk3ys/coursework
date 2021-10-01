select count(l_orderkey) as count from lineitem
inner join customer on c_custkey is o_custkey 
inner join supplier on s_suppkey is l_suppkey 
inner join orders on l_orderkey is o_orderkey 
where c_nationkey in (select c_nationkey from customer, nation 
                    where c_nationkey = n_nationkey and n_name = 'UNITED STATES') and s_nationkey in 
                    (select s_nationkey from supplier, nation, region 
                    where s_nationkey = n_nationkey 
                    and n_regionkey = r_regionkey
                    and r_name = 'AFRICA')