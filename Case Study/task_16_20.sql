use casestudy_week_1;

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

update khach_hang set ma_loai_khach = 1 where ma_khach_hang in(
select ma_khach_hang
from (select kh.ma_khach_hang, sum(ifnull(dv.chi_phi_thue, 0) + ifnull(hdct.so_luong, 0) * ifnull(dvdk.gia, 0)) as tong_tien
	from khach_hang kh
	left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
	left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
	left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
	left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
	left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
	where year(hd.ngay_lam_hop_dong) = 2021 and lk.ten_loai_khach = 'Platinium'
	group by ma_khach_hang
	having tong_tien > 1000000) as temp
);


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