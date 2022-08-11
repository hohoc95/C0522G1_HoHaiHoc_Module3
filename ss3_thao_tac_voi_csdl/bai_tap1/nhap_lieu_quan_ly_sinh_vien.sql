drop database if exists nhap_lieu_quan_ly_sinh_vien;

create database nhap_lieu_quan_ly_sinh_vien;

use nhap_lieu_quan_ly_sinh_vien;

create table class(
class_id int primary key auto_increment,
class_name varchar(60) not null,
start_date datetime not null,
statuss bit
);

create table student(
student_id int primary key auto_increment,
student_name varchar(45) not null,
address varchar(45) not null,
phone int,
statuss bit ,
class_id int ,
foreign key (class_id) references class(class_id)
);

create table subjects(
sub_id int primary key auto_increment,
sub_name varchar(30) not null,
credit tinyint not null default 1 check (credit >=1),
status bit default 1
);

create table mark(
mark_id int primary key auto_increment,
sub_id int,
student_id int,
mark float default 0 check  (mark between 0 and 100),
exam_times tinyint default 1,
unique(sub_id,student_id),
foreign key (sub_id) references subjects(sub_id),
foreign key (student_id) references student (student_id)
);

insert into class(class_id, class_name, start_date, statuss)
values 
(1, 'A1', '2008-12-20', 1),
(2, 'A2', '2008-12-22', 1),
(3, 'B3', current_date, 0);

insert into student (student_name, address, phone, statuss, class_id)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student (student_name, address, statuss, class_id)
values ('Hoa', 'Hai phong', 1, 1);
insert into student (student_name, address, phone, statuss, class_id)
values ('Manh', 'HCM', '0123123123', 0, 2);

insert into subjects
values (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

insert mark (sub_id, student_id, mark, exam_times)
values (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
       
SET SQL_SAFE_UPDATES = 0;   


select * from student 
where student_name like 'h%';

select * from class
where month (start_date) = 12;

select * from subjects
where credit >= 3 and credit <= 5;

update student
set class_id = 2
where student_name = 'Hung';
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select student.student_id, subjects.sub_id, mark.mark from mark
join student on student.student_id = mark.student_id
join subjects on subjects.sub_id = mark.sub_id
order by mark desc




