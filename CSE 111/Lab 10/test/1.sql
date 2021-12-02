create trigger t1 update of orders on o_orderdate
begin 
update orders set o_orderdate =  where customer_name = old.name;
end

insert into orders

select o_orderdate from orders
where o_orderdate