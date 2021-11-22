-- SQLite

--1
select c_name, sum(o_totalprice)
from orders, customer, nation
where o_custkey = c_custkey and
	n_nationkey = c_nationkey and
	n_name = 'FRANCE' AND
	o_orderdate like '1995-__-__'
group by c_name;

--2
select r_name, count(*)
from supplier, nation, region
where s_nationkey = n_nationkey
    and n_regionkey = r_regionkey
group by r_name;

--3
select n_name, count(*)
from orders, nation, region, customer
where c_custkey = o_custkey
    and c_nationkey = n_nationkey
    and n_regionkey = r_regionkey
    and r_name='AMERICA'
group by n_name;

--4
select s_name, count(ps_partkey)
from partsupp, supplier, nation, part
where p_partkey = ps_partkey
    and ps_suppkey = s_suppkey
    and s_nationkey = n_nationkey
    and n_name = 'CANADA'
    and p_size < 20
group by s_name;

--5
select c_name, count(*)
from orders, customer, nation
where o_custkey = c_custkey
    and c_nationkey = n_nationkey
    and n_name = 'GERMANY'
    and o_orderdate like '1993-__-__'
group by c_name;

--6
select s_name, o_orderpriority, count(distinct ps_partkey)
from partsupp, orders, lineitem, supplier, nation
where l_orderkey = o_orderkey
    and l_partkey = ps_partkey
    and l_suppkey = ps_suppkey
    and ps_suppkey = s_suppkey
    and s_nationkey = n_nationkey
    and n_name = 'CANADA'
group by s_name, o_orderpriority;

--7
select n_name, o_orderstatus, count(*)
from orders, customer, nation, region
where o_custkey = c_custkey
    and c_nationkey = n_nationkey
    and n_regionkey = r_regionkey
    and r_name='AMERICA'
group by n_name, o_orderstatus;

--8
select n_name, count(distinct l_orderkey) as co
from orders, nation, supplier, lineitem
where o_orderkey = l_orderkey
    and l_suppkey = s_suppkey
    and s_nationkey = n_nationkey
    and o_orderstatus = 'F'
    and o_orderdate like '1995-__-__'
group by n_name
having co > 50;

--9
select count(distinct o_clerk)
from orders, supplier, nation, lineitem
where o_orderkey = l_orderkey
    and l_suppkey = s_suppkey
    and s_nationkey = n_nationkey
    and n_name = 'UNITED STATES';

--10
select p_type, min(l_discount), max(l_discount)
from lineitem, part
where l_partkey = p_partkey
    and p_type like '%ECONOMY%'
    and p_type like '%COPPER%'
group by p_type;

--11
select r.r_name, s.s_name, s.s_acctbal
from supplier s, nation n, region r
where s.s_nationkey = n.n_nationkey
        and n.n_regionkey = r.r_regionkey
        and s.s_acctbal = (select max(s1.s_acctbal)
							from supplier s1, nation n1, region r1
							where s1.s_nationkey = n1.n_nationkey
								and n1.n_regionkey = r1.r_regionkey
								and r.r_regionkey = r1.r_regionkey
						);

--12
select n_name, max(s_acctbal) as mb
from supplier, nation
where s_nationkey = n_nationkey
group by n_name
having mb > 9000;

--13
select count(*)
from orders, lineitem, customer, supplier, nation n1, region, nation n2
where o_orderkey = l_orderkey
    and o_custkey = c_custkey
    and l_suppkey = s_suppkey
    and s_nationkey = n1.n_nationkey
    and n1.n_regionkey = r_regionkey
    and c_nationkey = n2.n_nationkey
    and r_name = 'AFRICA'
    and n2.n_name = 'UNITED STATES';

--14
select r1.r_name as suppRegion, r2.r_name as custRegion, max(o_totalprice)
from lineitem, supplier, orders, customer, nation n1, region r1, nation n2, region r2
where l_suppkey = s_suppkey
    and s_nationkey = n1.n_nationkey
    and n1.n_regionkey = r1.r_regionkey
    and l_orderkey = o_orderkey
    and o_custkey = c_custkey
    and c_nationkey = n2.n_nationkey
    and n2.n_regionkey = r2.r_regionkey
group by r1.r_name, r2.r_name;

--15
select count(distinct l_orderkey)
from lineitem, supplier, orders, customer
where l_suppkey = s_suppkey
    and l_orderkey = o_orderkey
    and o_custkey = c_custkey
    and c_acctbal > 0
    and s_acctbal < 0;
