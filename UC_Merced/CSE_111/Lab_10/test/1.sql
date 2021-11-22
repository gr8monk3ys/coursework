drop trigger if exists t1;

create trigger t1 after insert on orders
begin
    update orders
    set o_orderdate = '2021-12-01'
    where o_orderkey = NEW.o_orderkey;
end;

insert into orders 
select
    orders.o_orderkey + sub_query.max_id,
    o_custkey, o_orderstatus, o_totalprice, o_orderdate,
    o_orderpriority, o_clerk, o_shippriority, o_comment
from 
    orders, 
    (select max(o_orderkey) as max_id from orders) as sub_query
where substr(o_orderdate, 1, 7) between '1996-12' and '1996-12';

select count(*)
from orders
where o_orderdate like '%2021%';