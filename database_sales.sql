create database sales;
use sales;

create table orders(
order_id int primary key,
customer_name varchar(100) not null ,
product_category varchar(50) not null,
ordered_item varchar(100) not null,
contact_no varchar(15) unique not null
);
 
 alter table orders
 add order_quantity int ;
 alter table orders rename to sales_orders;
 
 insert into sales_orders (order_id, customer_name, product_category,
 ordered_item, contact_no, order_quantity) values
 (1,'rohith','electronics','laptop','8129123444',2),
 (2,'aju','home appliance','washing machine','9747939027',1),
 (3,'sowmya','furniture','sofa','8891570965',1),
 (4,'anagha','electronics','smart phone','5378289264',3),
 (5,'aginesh','groceries','rice','2443727899',5),
 (6,'amal','clothing','t-shirt','8891653478',4),
 (7,'aju','books','novel','8129543666',2),
 (8,'rihidh','electronics','tablet','9952464546',1),
 (9,'ian','furniture','table','9996254367',1),
 (10,'athul','stationery','notebook','6654783562',10);
 
 select customer_name, ordered_item
 from sales_orders;
 update sales_orders
 set ordered_item = 'Gaming laptop'
 where order_id =1;
 
 drop table sales_orders;