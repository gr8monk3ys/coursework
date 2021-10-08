--1
select distinct maker from Product
inner join Laptop on Laptop.model is Product.model
where screen > 16 and price < 2000;

--2
select distinct maker as Maker from Product
where type is 'pc' and maker not in (select maker from Product 
where type is 'laptop');

--3
select distinct maker, PC.model, Printer.model, (max(PC.price) + max(Printer.Price)) from Product, PC, Laptop, Printer
where maker in (select maker from Product 
where type is 'printer' and Printer.model is Product.model)
and maker in (select maker from Product 
where type is 'pc' and  PC.model is Product.model) 
group by Product.maker, Product.model;

--4
select hd from Laptop
group by hd having (count(model) >= 2);

--5
select model, price from PC
where price < (select min(price) from Laptop);

--6

select maker, PC_count, Printer_count from
(select maker, (select count(Product.model) from Product 
where (type = 'pc' or  type = 'laptop') and P1.maker = Product.maker) as  PC_count,
(select count(Product.model) from Product 
where type = 'printer' and P1.maker = Product.maker) as Printer_count from Product as P1
group by maker) as tb1 where PC_count >= 1 and Printer_count >= 2;