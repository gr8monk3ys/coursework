with localSup1994 as(
select n_name as supNat, count(l_linenumber) as numLocalSup from nation
inner join lineitem on l_suppkey is s_suppkey
inner join customer on c_custkey is o_custkey
inner join orders on o_orderkey is l_orderkey
inner join supplier on s_nationkey is n_nationkey 
where c_nationkey is not n_nationkey and strftime('%Y',l_shipdate) is '1994'
group by n_name
), localCus1994 as(
select n_name as cusNat, count(l_linenumber) as numLocalCus from supplier
inner join lineitem on l_suppkey is s_suppkey
inner join customer on c_custkey is o_custkey
inner join orders on o_orderkey is l_orderkey
inner join nation on n_nationkey is c_nationkey
where s_nationkey is not n_nationkey and strftime('%Y',l_shipdate) is '1994'
group by n_name), 
differenceEcoEx1994 as(
select localSup1994.supNat as name, (localSup1994.numLocalSup - localCus1994.numLocalCus) as differenceEco
from localSup1994, localCus1994
where localSup1994.supNat is localCus1994.cusNat
group by localSup1994.supNat),
localSup1995 as(
select n_name as supNat, count(l_linenumber) as numLocalSup from nation
inner join lineitem on l_suppkey is s_suppkey
inner join customer on c_custkey is o_custkey
inner join orders on o_orderkey is l_orderkey
inner join supplier on s_nationkey is n_nationkey 
where c_nationkey is not n_nationkey and strftime('%Y',l_shipdate) is '1995'
group by n_name), 
localCus1995 as(
select n_name as cusNat, count(l_linenumber) as numLocalCus from supplier
inner join lineitem on l_suppkey is s_suppkey
inner join customer on c_custkey is o_custkey
inner join orders on o_orderkey is l_orderkey
inner join nation on n_nationkey is c_nationkey
where s_nationkey is not n_nationkey and strftime('%Y',l_shipdate) is '1995'
group by n_name), 
differenceEcoEx1995 as(
select localSup1995.supNat as name, (localSup1995.numLocalSup - localCus1995.numLocalCus) as differenceEco
from localSup1995, localCus1995
where localSup1995.supNat is localCus1995.cusNat
group by localSup1995.supNat
),localSup1996 as(
select n_name as supNat, count(l_linenumber) as numLocalSup
from nation, supplier, customer, lineitem, orders
where l_suppkey is s_suppkey and c_custkey is o_custkey and o_orderkey is l_orderkey 
and s_nationkey is n_nationkey
and c_nationkey is not n_nationkey
and strftime('%Y',l_shipdate) is '1996'
group by n_name
), localCus1996 as(
select n_name as cusNat, count(l_linenumber) as numLocalCus
from nation, supplier, customer, lineitem, orders
where l_suppkey is s_suppkey and c_custkey is o_custkey and o_orderkey is l_orderkey 
and s_nationkey is not n_nationkey
and c_nationkey is n_nationkey
and strftime('%Y',l_shipdate) is '1996'
group by n_name
), differenceEcoEx1996 as(
select localSup1996.supNat as name, (localSup1996.numLocalSup - localCus1996.numLocalCus) as differenceEco
from localSup1996, localCus1996
where localSup1996.supNat is localCus1996.cusNat
group by localSup1996.supNat
)

select differenceEcoEx1994.name, differenceEcoEx1995.differenceEco - differenceEcoEx1994.differenceEco, differenceEcoEx1996.differenceEco - differenceEcoEx1995.differenceEco
from differenceEcoEx1994, differenceEcoEx1995, differenceEcoEx1996
where differenceEcoEx1994.name is differenceEcoEx1995.name
and differenceEcoEx1995.name is differenceEcoEx1996.name
group by differenceEcoEx1994.name;
