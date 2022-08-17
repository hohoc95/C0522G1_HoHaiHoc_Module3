drop database if exists bai_tap_view_index_store_procedure;
create database bai_tap_view_index_store_procedure;
use bai_tap_view_index_store_procedure;

create table product(
id int primary key auto_increment,
product_code int not null,
product_name varchar(45) not null,
product_price double not null,
product_amount int not null,
product_desciption varchar (45) not null,
product_status bit not null
);

insert into product(id, product_code, product_name, product_price, product_amount, product_desciption, product_status)
values
(1,01,'Bánh 1',10,151,'kjhkhjk',1),
(2,02,'Bánh 2',10,152,'kjhkhjk',1),
(3,03,'Bánh 3',10,153,'kjhkhjk',1),
(4,04,'Bánh 4',10,154,'kjhkhjk',1),
(5,05,'Bánh 5',10,155,'kjhkhjk',1),
(6,06,'Bánh 6',10,156,'kjhkhjk',1),
(7,07,'Bánh 7',10,157,'kjhkhjk',1),
(8,08,'Bánh 8',10,158,'kjhkhjk',1),
(9,09,'Bánh 9',10,159,'kjhkhjk',1);

-- Bước 3:

select * 
from product 
where product_name = 'Bánh 2';

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)

create unique index test_unique_index
on product (product_name);

-- Xóa Unique Index

drop index test_unique_index on product;

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào

explain  select * 
from product 
where product_name = 'Bánh 2';

-- Bước 4:

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.

create view product_view as

select product_code, product_name, product_price, product_status

from product;

select * 
from product_view ;

-- Tiến hành sửa đổi view

-- Tiến hành xoá view

-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product 

delimiter //

create procedure find_all_product()

begin

  select * 
  from product;

end //
find_all_productfind_all_productfind_all_product
delimiter ;

call find_all_product();

-- Tạo store procedure thêm một sản phẩm mới


 delimiter // 
 
create procedure insert_new_product(in p_code int,in p_name varchar(45),in p_price double,in p_amount int,in p_desciption varchar (45),in p_status bit)
begin
insert into product(product_code, product_name, product_price, product_amount, product_desciption, product_status) 
values (p_code, p_name, p_price, p_amount, p_desciption, p_status);
end //
delimiter ;

call insert_new_product(10,'Bánh 10',10,160,'kjhkhjk',1);

select * 
from product;

-- Tạo store procedure sửa thông tin sản phẩm theo id

 delimiter // 

create procedure edit_product(in p_id int,in p_code int,in p_name varchar(45),in p_price double,in p_amount int,in p_desciption varchar (45),in p_status bit)
begin
update product 
set product_code = p_code, 
product_name = p_name, 
product_price = p_price, 
product_amount = p_amount, 
product_desciption = p_desciption, 
product_status = p_status
where id = p_id;
 
end //
delimiter ;

call edit_product(10,10,'Bánh 10 B',10,160,'kjhkhjk',1);

select * 
from product;


-- Xóa theo id


delimiter //
create procedure delete_product(in p_id int)
begin
delete from product
where id = p_id;
end //
delimiter ;

call delete_product(1);
select * 
from product;


