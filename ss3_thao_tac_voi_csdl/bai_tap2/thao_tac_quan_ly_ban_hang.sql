drop database if exists thao_tac_quan_ly_ban_hang;
create database thao_tac_quan_ly_ban_hang;
use thao_tac_quan_ly_ban_hang;

create table customer(
customer_id int primary key,
customer_name varchar(20) not null,
customer_age int not null
);


create table orders(
order_id int primary key,
customer_id int not null,
foreign key (order_id) references customer(customer_id),
order_date datetime,
order_total_price double
);

create table product(
product_id int primary key,
product_name varchar(20) not null,
product_price double not null
);

create table order_detail(
order_id int,
product_id int,
order_quantity int not null,
primary key(order_id, product_id),
foreign key (order_id) references orders(order_id),
foreign key (product_id) references product(product_id)
);


insert into customer(customer_id, customer_name, customer_age)
values
(1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);

insert into orders(order_id,customer_id,order_date,order_total_price)
values
(1,1,'2006-3-21',null),
(2,2,'2006-3-23',null),
(3,1,'2006-3-16',null);

insert into product(product_id,product_name,product_price)
values
(1,'May Giat',3),
(2,'Tu Lanh',5),
(3,'Dieu Hoa',7),
(4,'Quat',1),
(5,'Bep Dien',2);

insert into order_detail(order_id,product_id,order_quantity)
values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

select * from orders;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

select order_id, order_date, order_total_price from orders;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách

select customer.customer_name, product.product_name from customer
join orders on customer.customer_id = orders.customer_id 
join order_detail on orders.order_id = order_detail.order_id
join product on order_detail.product_id = product.product_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào

select customer.customer_id, customer.customer_name from customer
where customer.customer_id not in
(select customer.customer_id
from customer
join orders on customer.customer_id = orders.customer_id
join order_detail on order_detail.order_id = orders.order_id
join product on product.product_id = order_detail.product_id);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)
select orders.order_id, orders.order_date as date_pay,
sum((ifnull(order_detail.order_quantity,0)* ifnull(product.product_price,0))) as bill_order
from orders
join order_detail on orders.order_id = order_detail.order_id
join product on product.product_id = order_detail.product_id
group by orders.order_id;
