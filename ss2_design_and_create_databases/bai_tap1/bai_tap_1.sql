drop database if exists quan_ly_xuat_nhap;
create database quan_ly_xuat_nhap;
use quan_ly_xuat_nhap;

create table phieu_xuat(
so_px int primary key auto_increment,
ngay_xuat datetime not null
);

create table vat_tu(
ma_vtu int  primary key auto_increment,
ten_vtu varchar(40) not null
);

create table chi_tiet_phieu_xuat(
dg_xuat double not null,
sl_xuat int not null,
so_px int,
ma_vtu int,
primary key(so_px, ma_vtu),
foreign key (so_px) references phieu_xuat(so_px),
foreign key (ma_vtu) references vat_tu(ma_vtu)
);

create table phieu_nhap(
so_pn int primary key auto_increment,
ngay_nhap datetime not null
);

create table chi_tiet_phieu_nhap(
dg_nhap double not null,
sl_nhap int not null,
so_pn int,
ma_vtu int,
primary key(so_pn, ma_vtu),
foreign key (so_pn) references phieu_nhap(so_pn),
foreign key (ma_vtu) references vat_tu(ma_vtu)
);

create table nha_cc(
ma_ncc int primary key auto_increment,
ten_ncc varchar(40) not null,
dia_chi varchar(40) not null,
sdt char
);

create table don_dh(
so_dh int primary key auto_increment,
ngay_dh datetime not null,
ma_ncc int,
foreign key (ma_ncc) references nha_cc(ma_ncc)
);

create table chi_tiet_don_dat_hang(
ma_vtu int,
so_dh int,
primary key(ma_vtu, so_dh),
foreign key (ma_vtu) references vat_tu(ma_vtu),
foreign key (so_dh) references don_dh(so_dh)
);


create table so_dien_thoai(
sdt varchar(10) primary key,
ma_ncc int,
foreign key (ma_ncc) references nha_cc(ma_ncc)
);
