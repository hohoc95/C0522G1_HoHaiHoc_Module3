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

-- select * from users where country like "V%";

-- select * from users where country like ?;

--  Stored Procedures từ JDBC sử dụng CallableStatement cho chức năng hiển thị danh sách users

Delimiter $$
create procedure show_list()
begin
	select * 
    from users;
end $$
Delimiter ;

call show_list();

-- Gọi Stored Procedures từ JDBC sử dụng CallableStatement cho chức năng sửa thông tin user

DELIMITER $$
CREATE PROCEDURE update_user(user_name varchar(120), user_email varchar(120), user_country varchar(120), IN user_id INT)
BEGIN
update users 
set name = user_name, email = user_email, country = user_country
 where id = user_id;
END$$
DELIMITER ;


-- Delimiter $$
-- create procedure edit_sp(id_sp int, name_sp varchar(45), email_sp varchar(45), country_sp varchar(45))
-- begin
-- 	update users 
--     set name = name_sp,
-- 				email= email_sp,
-- 				country =country_sp 
-- 	where id = id_sp;
-- end $$
-- Delimiter ;

-- call edit_sp();

-- Gọi Stored Procedures từ JDBC sử dụng CallableStatement cho chức năng xoá user

-- Delimiter $$
-- create procedure delete_sp(id_sp int)
-- begin
-- 	delete from users 
--     where id = id_sp;
-- end $$
-- Delimiter ;

-- call delete_sp(2);

select * 
from users;