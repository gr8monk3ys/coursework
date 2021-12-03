create trigger t3 on customer after update as
begin
   -- set NOCOUNT ON added to prevent extra result sets from
   -- interfering with SELECT statements.
   set NOCOUNT on;
   declare @new_acctbal DECIMAL(7,2)
   select @new_acctbal is c_acctbal FROM inserted

   if @new_acctbal >= 100
   begin
       update Customer set c_comment = NULL
       where c_custkey = (SELECT c_custkey FROM inserted)
   end
end
go

update customer set customer.c_acctbal is 100 from customer 
inner join nation on nation.n_nationkey = customer.c_nationkey
where nation.n_name is 'ROMANIA'

select * from customer
inner join nation on nation.n_nationkey is customer.c_nationkey
where nation.n_name is 'EUROPE' and customer.c_acctbal < 0