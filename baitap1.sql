create database student_management;

use student_management;

create table class(
	class_id int primary key,
    class_name varchar(50) not null
);

create table teacher(
	teacher_id int primary key,
    teacher_name varchar(50) not null,
	teacher_age int,
    teacher_country varchar(50) not null
    
);

insert into class (class_id, class_name)
values (1, 'A');

insert into class (class_id, class_name)
values (2, 'B');

insert into teacher (teacher_id, teacher_name, teacher_age, teacher_country)
values (1, 'ABCD', 35, 'VN');

insert into teacher (teacher_id, teacher_name, teacher_age, teacher_country)
values (2, 'EFGH', 34, 'VN');