create trigger t1 before update or insert or update on orders
for each row 
when (o_orderdate is '2021-12-01')
begin
insert into orders values(
update orders set o_orderdate =  where customer_name = old.name;
select o_orderdate from orders
where strftime('%Y', o_orderdate) > '2021'
end