select r_name, count(s_suppkey) from supplier
inner join region on r_regionkey is n_regionkey
inner join nation on n_nationkey is s_nationkey
where s_acctbal < (select avg(s_acctbal) from supplier)
group by r_name;
