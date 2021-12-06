create trigger update_attribute after update on orders
for each row
when(o_orderpriority != 'HIGH')
begin
update orders set o_orderpriority = 'HIGH'
delete lineitem
end