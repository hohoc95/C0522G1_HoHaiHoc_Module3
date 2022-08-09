drop database if exists quan_ly_ban_hang;
create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
customer_id int primary key auto_increment,
c_name varchar(20) not null,
c_age int not null
);


create table `order`(
order_id int primary key auto_increment,
customer_id int not null,
foreign key (order_id) references customer(customer_id),
order_date datetime,
order_total_price double
);

create table product(
product_id int primary key auto_increment,
product_name varchar(20) not null,
product_price double
);

create table order_detail(
order_id int,
product_id int,
primary key(order_id, product_id),
foreign key (order_id) references `order`(order_id),
foreign key (product_id) references product(product_id)
);

