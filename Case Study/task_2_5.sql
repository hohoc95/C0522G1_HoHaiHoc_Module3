use casestudy_week_1;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

select 	ma_nhan_vien, ho_ten 
from nhan_vien 
where ho_ten like 'T%'
or ho_ten like 'H%' 
or ho_ten like 'K%' 
and length(ho_ten) <= 15;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select ma_khach_hang, ho_ten from khach_hang where (dia_chi like '%Đà Năng'or dia_chi like '%Quảng Tri')
and (round(datediff(curdate(),ngay_sinh)/365,0) <= 50
and (round(datediff(curdate(),ngay_sinh)/365,0) >=18));

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select khach_hang.ma_khach_hang, khach_hang.ho_ten, count(hop_dong.ma_khach_hang) 
from khach_hang 
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where khach_hang.ma_loai_khach = 1
group by ma_khach_hang
order by count(hop_dong.ma_khach_hang);

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: 
-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

SELECT 
    khach_hang.ma_khach_hang,
    khach_hang.ho_ten,
    loai_khach.ten_loai_khach,
    hop_dong.ma_hop_dong,
    dich_vu.ten_dich_vu,
    hop_dong.ngay_lam_hop_dong,
    hop_dong.ngay_ket_thuc,
    (IFNULL(dich_vu.chi_phi_thue, 0) + IFNULL(dich_vu_di_kem.gia, 0) * IFNULL(hop_dong_chi_tiet.so_luong, 0)) AS tong_tien
FROM
    khach_hang
        LEFT JOIN
    loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
        LEFT JOIN
    hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
        LEFT JOIN
    dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
GROUP BY ma_hop_dong
ORDER BY ma_khach_hang , ma_hop_dong DESC;


-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 
-- (Quý 1 là tháng 1, 2, 3).

select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
where dich_vu.ma_dich_vu
not in(
select dich_vu.ma_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where (year(ngay_lam_hop_dong) = 2021 and month(ngay_lam_hop_dong) between 1 and 3))
group by dich_vu.ma_dich_vu
order by dien_tich desc ;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where (year(ngay_lam_hop_dong) = 2020) and hop_dong.ma_dich_vu
not in(
select dich_vu.ma_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
where ( year(ngay_lam_hop_dong) = 2021))
group by dich_vu.ma_dich_vu;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

-- Cách 1

select ho_ten
from khach_hang
group by ho_ten;

-- Cách 2
select ho_ten from khach_hang
union
select ho_ten from khach_hang;

-- Cách 3
select distinct ho_ten from khach_hang;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(ngay_lam_hop_dong), 
count(ma_khach_hang)
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by ngay_lam_hop_dong
order by ngay_lam_hop_dong;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select hop_dong.ma_hop_dong, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc, 
sum(ifnull(hop_dong_chi_tiet.so_luong, 0)) 
from hop_dong
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
group by ma_hop_dong;



-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là 
-- “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select dich_vu_di_kem.ma_dich_vu_di_kem ,
dich_vu_di_kem.ten_dich_vu_di_kem
from dich_vu_di_kem
join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where (loai_khach.ten_loai_khach = 'Diamond')
and (khach_hang.dia_chi like '%Vinh'
or khach_hang.dia_chi like '%Quảng Ngãi');

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc 
-- của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select hop_dong.ma_hop_dong,
nhan_vien.ho_ten,
khach_hang.ho_ten,
khach_hang.ho_ten,
khach_hang.so_dien_thoai,
dich_vu.ten_dich_vu,
SUM(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem,
hop_dong.tien_dat_coc
from hop_dong
left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
left join nhan_vien on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
left join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where (year(hop_dong.ngay_lam_hop_dong) = 2020 and month(hop_dong.ngay_lam_hop_dong) between 10 and 12 ) and hop_dong.ma_hop_dong
not in(
select hop_dong.ma_hop_dong
from hop_dong 
where year(hop_dong.ngay_lam_hop_dong) = 2021 and (month(hop_dong.ngay_lam_hop_dong) between 1 and 6))
group by hop_dong.ma_hop_dong;



-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem = (
	select sum(hdct.so_luong) as sl
	from hop_dong_chi_tiet hdct
    group by ma_dich_vu_di_kem
    order by sl desc
    limit 1);
    
    
-- 14. Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong,
-- ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung
from dich_vu dv
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having so_lan_su_dung = 1;

-- 15. Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi, count(hd.ma_nhan_vien) as so_hop_dong_tu_2020_den_2021
from nhan_vien nv 
join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
group by ma_nhan_vien
having so_hop_dong_tu_2020_den_2021 <= 3;

-- 16. Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

select  nhan_vien.ma_nhan_vien, nhan_vien.ho_ten as ten_nhan_vien, hop_dong.ma_hop_dong
from nhan_vien
left join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
where  hop_dong.ma_hop_dong  is null; 

SET SQL_SAFE_UPDATES = 0;
update nhan_vien
set nhan_vien.tinh_trang_lam_viec = 0
where nhan_vien.ma_nhan_vien not in
(
select ma_nhan_vien
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) in (2019, 2021)
group by ma_nhan_vien
);

select* from nhan_vien;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

-- update loai_khach
-- set ma_loai_khach =1
-- where(

-- select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ma_loai_khach, loai_khach.ten_loai_khach
-- from khach_hang 
-- join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach  
-- join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
-- join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
-- join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
-- join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
--  where loai_khach.ma_loai_khach = 2
-- group by ma_khach_hang
-- having sum((ifnull(dich_vu.chi_phi_thue,0) * datediff(hop_dong.ngay_ket_thuc,hop_dong.ngay_lam_hop_dong))+ ifnull(hop_dong_chi_tiet.so_luong,0)* ifnull(dich_vu_di_kem.gia,0))  > 1000000
-- order by  khach_hang.ma_khach_hang;

-- select sum( (ifnull(dich_vu.chi_phi_thue,0) * datediff(hop_dong.ngay_ket_thuc,hop_dong.ngay_lam_hop_dong))+ ifnull(hop_dong_chi_tiet.so_luong,0)* ifnull(dich_vu_di_kem.gia,0)) as gia
-- from khach_hang 
-- join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach  
-- join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
-- join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
-- join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
-- join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
-- group by khach_hang.ma_khach_hang
-- order by  khach_hang.ma_khach_hang ;


-- 18. Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
select khach_hang.ma_khach_hang, khach_hang.ho_ten
from khach_hang 
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where year(hop_dong.ngay_lam_hop_dong) < 2021;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem
from dich_vu_di_kem join hop_dong_chi_tiet
on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2020
and hop_dong_chi_tiet.so_luong > 10;

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm 
-- id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select ma_khach_hang as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi from khach_hang
union 
select ma_nhan_vien as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi from nhan_vien;

-- 21. Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.

create view v_nhan_vien as
select nv.ma_nhan_vien, nv.ho_ten, nv.dia_chi, hd.ngay_lam_hop_dong
from nhan_vien nv
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where nv.dia_chi like '%Yên Bái%' and hd.ngay_lam_hop_dong = '2021-04-25';

select * from v_nhan_vien;

drop view v_nhan_vien;

-- 22. Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.

update v_nhan_vien set dia_chi = 'Liên Chiểu, Đà Nẵng';

