drop database if exists demo_ss13;
create database demo_ss13;
use demo_ss13;

create table users(
	id int primary key auto_increment,
    name varchar(120) not null,
    email varchar(120) not null,
    country varchar(120)
);
insert into users(name, email, country)
values
('Minh','minh@codegym.vn','Viet Nam'),
('Kante','kante@che.uk','Kenia');
