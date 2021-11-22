drop trigger if exists t5;

create trigger t5 after delete on part
begin
delete from lineitem
where l_partkey = old.p_partkey;
delete from partsupp
where ps_partkey = old.p_partkey;
end;

delete from part
where p_partkey in(select ps_partkey from partsupp 
inner join supplier on s_suppkey = ps_suppkey
inner join nation on n_nationkey = s_nationkey
where (n_name = 'UNITED STATES' or n_name = 'CANADA'));

select n_name, count(*) from partsupp, region
inner join part on p_partkey = ps_partkey
inner join supplier on s_suppkey = ps_suppkey
inner join nation on n_regionkey = r_regionkey
where p_partkey = ps_partkey
and ps_suppkey = s_suppkey
and s_nationkey = n_nationkey
and n_regionkey = r_regionkey
and r_name = 'AMERICA'
group by n_name;