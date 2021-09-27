-- SQLite
.headers on

--1
select maker as Maker from Product, Printer
where (Product.model is Printer.model and color is true and price < 120);

--2

select distinct maker as Maker from Product
where Product.type is "pc" and maker not in (select maker from Product where Product.type is "laptop" and Product.type is "printer");

--3

select distinct Product.maker as Maker, PC.model as PC_model, Laptop.model as Laptop_model, (max(PC.price) + max(Laptop.Price)) as Combination_price from Product, PC, Laptop
where maker in (select maker from Product where type is "laptop" and Laptop.model is Product.model)
and maker in (select maker from Product where type is "pc" and  PC.model is Product.model) group by Product.maker, Product.model;

--4

select model as Model, screen as Screen from Laptop
group by screen having (count(screen) >= 2);

--5

select model as Model, price as Price from Laptop
where price > (select max(price) from PC);

--6

select distinct maker as Maker from Product, PC, Laptop, Printer
where Product.type is "printer" and maker in (select maker from Product, Laptop, PC where Product.model is Laptop.model or Product.model is PC.model)
group by Product.maker having count(distinct Printer.model) >= 2;
