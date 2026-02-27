with localSup as(
select n_name as supNat, count(l_linenumber) as numLocalSup from nation
inner join lineitem on l_suppkey is s_suppkey
inner join customer on c_custkey is o_custkey
inner join orders on o_orderkey is l_orderkey
inner join supplier on s_nationkey is n_nationkey
where c_nationkey != n_nationkey and strftime('%Y',l_shipdate) is '1994'
group by n_name), 
localCus as (select n_name as cusNat, count(l_linenumber) as numLocalCus from supplier
inner join lineitem on l_suppkey is s_suppkey
inner join customer on c_custkey is o_custkey
inner join orders on o_orderkey is l_orderkey
inner join nation on n_nationkey is c_nationkey
where s_nationkey != n_nationkey and strftime('%Y',l_shipdate) is '1994'
group by n_name)

select localSup.supNat, localSup.numLocalSup - localCus.numLocalCus
from localSup, localCus
where localSup.supNat is localCus.cusNat
group by localSup.supNat;
