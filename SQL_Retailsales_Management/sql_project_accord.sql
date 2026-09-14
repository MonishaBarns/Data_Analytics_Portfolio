create database smart_retail_project

use smart_retail_project

create table category(
categoryid int primary key identity(1,1),
categoryname varchar(20),
description_of_the_product varchar(50))

create table suppiler(
suppilerid int primary key identity(201,1),
suppliername varchar(20),
phonenumber bigint,
email varchar(50))

create table customer(
customerid int primary key identity(101,1),
customername varchar(20),
phoneno bigint,
email_id varchar(50),
adress varchar(60))

create table order_table(
orderid int primary key identity(10,1),
orderdate date,
total_amount bigint,
cid int foreign key references customer(customerid))

create table warehouse(
warehouseid int primary key identity(501,1),
warehouse_name varchar(30),
loaction varchar(30))


create table payment(
paymentid int primary key identity(401,1),
order_id int foreign key references order_table(orderid),
payment_date date,
payment_method varchar(20),
payment_amount money check(payment_amount>0))


create table product_table(
product_id int primary key identity(301,1),
product_name varchar(20),
price money check(price>0),
quantity_in_stock int,
catId int foreign key references customer(customerid),
supId int foreign key references suppiler(suppilerid),
wareId int foreign key references warehouse(warehouseid))

--sp_help product_table
--ALTER TABLE product_table
--DROP CONSTRAINT FK__product_t__catId__6C190EBB;

--ALTER TABLE product_table
--ADD CONSTRAINT FK_product_category
--FOREIGN KEY (catId)
--REFERENCES category(categoryid);
--(UPDATE payment SET order_id = 10 WHERE paymentid = 401
--UPDATE payment SET order_id = 11 WHERE paymentid = 402
--UPDATE payment SET order_id = 12 WHERE paymentid = 403
--UPDATE payment SET order_id = 13 WHERE paymentid = 404
--UPDATE payment SET order_id = 14 WHERE paymentid = 405
--UPDATE payment SET order_id = 15 WHERE paymentid = 406
--UPDATE payment SET order_id = 16 WHERE paymentid = 407
--UPDATE payment SET order_id = 17 WHERE paymentid = 408
--UPDATE payment SET order_id = 18 WHERE paymentid = 409
--UPDATE payment SET order_id = 19 WHERE paymentid = 410)

create table order_detail(
order_id int,
productid int,
quantity int,
primary key(order_id, productid),
foreign key (order_id) references order_table(orderid),
foreign key (productid) references product_table(product_id))

-- CATEGORY
INSERT INTO Category (CategoryName, description_of_the_product) VALUES
( 'Electronics', 'Electronic devices'),
( 'Furniture', 'Home and office furniture'),
( 'Clothing', 'Apparel and garments'),
( 'Food', 'Grocery items'),
( 'Books', 'Printed and digital books'),
( 'Sports', 'Sports equipment'),
( 'Beauty', 'Beauty products'),
( 'Toys', 'Kids toys'),
( 'Automotive', 'Vehicle accessories'),
( 'Stationery', 'Office supplies');

-- SUPPLIER
INSERT INTO suppiler (suppliername, phonenumber, email) VALUES
('TechSource Ltd', 1112221001, 'techsource@email.com'),
('FurniWorld', 1112221002, 'furniworld@email.com'),
('StyleHub', 1112221003, 'stylehub@email.com'),
('FreshMart', 1112221004, 'freshmart@email.com'),
('BookPlanet', 1112221005, 'books@email.com'),
('SportyPro', 1112221006, 'sporty@email.com'),
('BeautyGlow', 1112221007, 'beauty@email.com'),
('ToyLand', 1112221008, 'toyland@email.com'),
('AutoGear', 1112221009, 'autogear@email.com'),
('OfficePlus', 1112221010, 'office@email.com');

-- WAREHOUSE
INSERT INTO warehouse (warehouse_name, loaction) VALUES
('Central Warehouse', 'New York'),
('West Storage', 'Los Angeles'),
('East Depot', 'Boston'),
('South Hub', 'Texas'),
('North Storage', 'Chicago'),
('Metro Warehouse', 'Miami'),
('Prime Depot', 'Seattle'),
('Quick Storage', 'Denver'),
('City Warehouse', 'Atlanta'),
('Global Depot', 'Phoenix');

-- PRODUCT
INSERT INTO product_table (product_name, price, quantity_in_stock) VALUES
('Laptop', 800, 50),
('Office Chair', 120, 100),
('T-Shirt', 25, 200),
('Rice Bag', 40, 150),
('Novel Book', 15, 120),
('Football', 30, 80),
('Face Cream', 18, 90),
('Toy Car', 22, 110),
('Car Battery', 150, 60),
('Notebook Pack', 10, 300);

-- CUSTOMER
INSERT INTO customer (customername, phoneno, email_id, adress) VALUES
('John Smith', 5550001, 'john@email.com', 'NY'),
('Sarah Lee', 5550002, 'sarah@email.com', 'LA'),
('David Kim', 5550003, 'david@email.com', 'TX'),
('Emma Brown', 5550004, 'emma@email.com', 'FL'),
('Michael Chen', 5550005, 'michael@email.com', 'WA'),
('Olivia Davis', 5550006, 'olivia@email.com', 'NV'),
('Daniel Wilson', 5550007, 'daniel@email.com', 'IL'),
('Sophia Moore', 5550008, 'sophia@email.com', 'GA'),
('James Taylor', 5550009, 'james@email.com', 'AZ'),
('Ava Martinez', 5550010, 'ava@email.com', 'CO');

-- ORDERS
INSERT INTO order_table(OrderDate,total_amount) VALUES
('2026-01-01', 800),
('2026-01-02', 120),
('2026-01-03', 50),
('2026-01-04', 40),
('2026-01-05', 30),
('2026-01-06', 18),
('2026-01-07', 22),
('2026-01-08', 150),
('2026-01-09', 10),
('2026-01-10', 25);


select * from warehouse
-- ORDER_DETAIL
INSERT INTO order_detail(order_id, productid, quantity) VALUES
(10,301,1),
(11,302,1),
(12,303,2),
(13,304,1),
(14,305,1),
(15,306,1),
(16,307,1),
(17,308,1),
(18,309,1),
(19,310,1);

-- PAYMENT
INSERT INTO payment (payment_date, payment_method, payment_amount) VALUES
('2026-01-01', 'Credit Card', 800),
('2026-01-02', 'Cash', 120),
('2026-01-03', 'Debit Card', 50),
('2026-01-04', 'Cash', 40),
('2026-01-05', 'Credit Card', 30),
('2026-01-06', 'Online', 18),
('2026-01-07', 'Debit Card', 22),
('2026-01-08', 'Credit Card', 150),
('2026-01-09', 'Cash', 10),
('2026-01-10', 'Online', 25);

--section D
--Display all products
select product_id ,product_name from product_table

--Display products whose price is greater than 1000.
select product_id, product_name, price from product_table where price>1000

--Find customers from a particular city(eg.LA)
select customerid, customername ,adress from customer where adress='LA'

--Update the price of a product.id=309
select * from product_table
update product_table set price=1010 where product_id=309

--Delete customers who have not placed any orders
select customer.adress, customer.email_id, customer.phoneno, customer.customername, customer.customerid
from customer left join order_table on order_table.cid = customer.customerid where order_table.cid is null

delete customer from customer left join order_table on order_table.cid = customer.customerid where order_table.cid is null

--section E

--List orders sorted by order date.
select * from order_table order by orderdate asc

--Show total sales for each day.
select orderdate,sum(total_amount) as 'Total Amount' from order_table group by orderdate

--Find total quantity sold for each product.
select productid, sum(quantity) as 'Total Quantity' from order_detail group by productid

--Display customers who placed more than three orders
select cid as 'Customer ID', count(orderid) as 'Count' from order_table group by cid having count(cid)>3 

--Section F
--Display order details with customer name and product name
select customer.customerid, customer.customername,product_table.product_name, product_table.product_id, order_detail.order_id 
from order_table
 join customer on order_table.cid=customer.customerid
 join order_detail on  order_table.orderid = order_detail.order_id
 join product_table on  order_detail.productid = product_table.product_id

 --Display supplier-wise product list.
 select product_table.product_id, product_table.product_name, suppiler.suppliername
 from order_detail
 join product_table on order_detail.productid=product_table.product_id
 join suppiler on product_table.supId = suppiler.suppilerid


 --example of JOINS: 
 --inner join: show customers who have placed orders.
 select customer.customerid, customer.customername, order_table.orderid from customer inner join order_table on customer.customerid = order_table.cid


 --left join: Show all products and their supplier names
 select product_table.product_id, product_table.product_name, suppiler.suppliername from product_table left join suppiler on product_table.supId = suppiler.suppilerid

 --right join: Show all warehouses and the products stored in them.
 select warehouse.warehouseid, warehouse.warehouse_name, product_table.product_name from warehouse right join product_table on warehouse.warehouseid = product_table.wareId

 --full join: Show all customers and all payments, whether they match or not.
 select customer.customerid, customer.customername, payment.paymentid, payment.payment_amount from customer full join payment on customer.customerid = payment.order_id



 --section G 
 --Find products priced higher than average price
 select price, product_id, product_name from product_table where price>(select avg(price) from product_table)

 --Display customers who never placed an order.
 select * from customer where customerid NOT IN(select cid from order_table)

 --Find top-selling product using subquery.
select productid from order_detail group by productid having sum(quantity) =
(select max(Total_quantity) from
(select productid, sum(quantity) as Total_quantity from order_detail group by productid) as sales)

--Section H
--Create a scalar function to calculate discount.
create function caluculate_discount(@num money) 
returns money
as
 begin
    return
    if @num > 1000
        set @num = @num * 0.10;
    else if @num > 500
        set @num = @num * 0.05;
    else
        set @num = @num * 0.02;
      return @num;
  end

  select dbo.caluculate_discount(500) as 'To Calculate discount'

 --Create a stored procedure to place a new order.
 create procedure neworder(@orderdate date, @total_amount money, @cid int)
 as
 begin
  insert into order_table(orderdate, total_amount,cid) values (@orderdate, @total_amount, @cid)
 end

 exec neworder '2026-02-13', 250, 108

--Create a procedure using input and output parameters.
--previous code is an example code with input parameters
 create procedure neworder(@orderdate date, @total_amount money, @cid int)
 as
 begin
  insert into order_table(orderdate, total_amount,cid) values (@orderdate, @total_amount, @cid)
 end

 exec neworder '2026-02-13', 250, 105


 --section I

 --Create trigger AFTER INSERT on Order table to update stock.
 create trigger trigger_UpdateStock
on order_detail after insert
as
begin
    update product_table
    set product_table.quantity_in_stock = product_table.quantity_in_stock - order_detail.quantity
    from product_table
    join order_detail
        on product_table.product_id = order_detail.productid;
end;
 --Create trigger AFTER DELETE on Order_Detail to restore stock.
 create trigger trg_RestoreStockAfterDelete
on order_detail after delete
as
begin
    update product_table
    set product_table.quantity_in_stock = product_table.quantity_in_stock + order_detail.quantity
    from product_table 
    join order_detail
        on product_table.product_id = order_detail.productid;
end
 --Create a view for monthly sales report.
create view monthly_sales_report
as
select year(orderdate) as 'Sales Year', month(orderdate) as 'Sales Month', sum(total_amount) as 'Total Month sales' 
from order_table group by month(orderdate), year(orderdate)

select * from monthly_sales_report

--Create an index on ProductName.
create clustered index prodeuctnameindex on product_table(product_name asc)


