use casestudy_week_1;

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

update v_nhan_vien
set dia_chi = 'Liên Chiểu, Đà Nẵng';
select * from nhan_vien
where dia_chi = 'Liên Chiểu, Đà Nẵng';

-- where ma_nhan_vien = 2;
-- select * from v_nhan_vien;

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó 
-- với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

delimiter //
create procedure sp_xoa_khach_hang(in p_id int)
begin 

-- Không nên sử dụng delete from (delete from khach_hang) ... vì sẽ xóa dữ liệu
-- Sử dụng flag (cờ) để xóa. 

update khach_hang set is_delete = 1
where ma_khach_hang = p_id;
end //
delimiter ;

call sp_xoa_khach_hang(1);

select * from khach_hang;

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong 
-- phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong
--  thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console


