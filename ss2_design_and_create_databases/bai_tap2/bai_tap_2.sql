drop database if exists quan_ly_ban_hang;
create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
customer_id int primary key,
customer_name varchar(20) not null,
customer_age int not null
);


create table `order`(
order_id int primary key,
customer_id int not null,
foreign key (order_id) references customer(customer_id),
order_date datetime,
order_total_price double not null
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
foreign key (order_id) references `order`(order_id),
foreign key (product_id) references product(product_id)
);

