create database casetudy_week_1;
use casetudy_week_1;

create table vi_tri(
	ma_vi_tri int primary key,
    ten_vi_tri varchar(50) not null
);

insert into vi_tri(ma_vi_tri, ten_vi_tri)
values (1, 'Quản lý');

insert into vi_tri(ma_vi_tri, ten_vi_tri)
values (2, 'Nhân viên');

create table trinh_do(
	ma_trinh_do int primary key,
    ten_trinh_do varchar(50) not null
);

insert into trinh_do(ma_trinh_do, ten_trinh_do)
values (1, 'Trung Cấp');
insert into trinh_do(ma_trinh_do, ten_trinh_do)
values (2, 'Cao Đẳng');
insert into trinh_do(ma_trinh_do, ten_trinh_do)
values (3, 'Đại Học');
insert into trinh_do(ma_trinh_do, ten_trinh_do)
values (4, 'Sau Đại Học');

create table bo_phan(
	ma_bo_phan int primary key,
    ten_bo_phan varchar(50) not null
);

insert into bo_phan(ma_bo_phan, ten_bo_phan)
values 
(1, 'Sale-Marketing'),
(2, 'Hành chính'),
(3, 'Phục vụ'),
(4, 'Quản lý');

create table nhan_vien(
	ma_nhan_vien int primary key,
    ho_ten varchar(50) not null,
    ngay_sinh date not null,
    so_cmnd varchar(50) not null unique,
    luong varchar(50) not null,
    so_dien_thoai varchar(50) not null unique,
    email varchar(50) not null unique,
    dia_chi varchar(50) not null unique,
    ma_vi_tri int foreign key
);
        

