drop trigger if exists delete_attribute;

create trigger delete_attribute after delete on lineitem
begin
update orders set o_orderpriority = 'HIGH'
where o_orderkey = OLD.l_orderkey;
end;

drop trigger if exists insert_attribute;

create trigger insert_attribute after insert on lineitem
begin
update orders set o_orderpriority = 'HIGH'
where o_orderkey = OLD.l_orderkey;
end;

delete from lineitem where l_orderkey in (select l_orderkey from lineitem
inner join orders on o_orderkey = l_orderkey
where o_orderdate like '%1995-12%');

select count(*) from orders
where o_orderpriority = 'HIGH' and substr(o_orderdate, 0, 7) between '1995-09' and '1995-12';
