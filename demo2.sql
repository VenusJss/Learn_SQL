﻿create database quan_li_diem_sinh_vien��
use quan_li_diem_sinh_vien
drop table sinh_vien
--Tạo một bảng quản lí điểm sinh viên
create table sinh_vien(
ma int identity,
ho_ten nvarchar(50),
diem_lan_1 float default 5,
diem_lan_2 float,
primary key (ma),
constraint check_diem_lan_2 check(diem_lan_1 >= 0 and diem_lan_1 <= 10 and diem_lan_2 >= 0 and diem_lan_2 <=10) 
)�
--check điểm lần 2 không được phép nhập khi điểm lần 1 lớn hơn 5
alter table sinh_vien
add constraint check_nhap_diem_lan_2 check(( diem_lan_1 >= 5 and diem_lan_2 is null) or diem_lan_1 < 5)
-- tên không được ngắn hơn hai kí tự
alter table sinh_vien
add constraint check_ho_ten check(len(ho_ten) >= 2)

-- Nhập các bạn sinh viên
insert into sinh_vien(ho_ten, diem_lan_1, diem_lan_2)
values(N'Phạm Đức Đạt',3,6),(N'Phạm Anh Qúy', 6,7),(N'Phạm Duy Phong', 6,null)
�--Lấy ra các bạn có điểm lần 1 hoặc lần 2 lớn hơn 5
select * from sinh_vien
where (diem_lan_1 > 5 or diem_lan_2 >5)
--Lấy ra cấc bạn qua môn ngay từ lần 1
select * from sinh_vien
where diem_lan_1 > 5���
-- Lấy ra các bạn trượt môn�
select * from sinh_vien
where diem_lan_1 < 5 and diem_lan_2 < 5�
--�Đêm số bạn qua môn sau khi thi lần 2�
select count(*) as so_sinh_vien_qua_mon from sinh_vien
where diem_lan_1 >=5 or diem_lan_2 >= 5
--Đếm số bạn trượt lần 1 và qua môn sau lần 2
select * from sinh_vien
where diem_lan_1 < 5 and diem_lan_2 >= 5
�-----ex
insert into sinh_vien(ho_ten,diem_lan_1,diem_lan_2)
values(N'hùng',7,null)�
--đếm số bạn phải thi làn 2
insert into sinh_vien(ho_ten,diem_lan_1,diem_lan_2)
values( 'Anh',2,null)
select count(*) as so_ban_can_thi_lan_2 from sinh_vien
where (diem_lan_1 < 5 and diem_lan_2 is null)
--end bai tap
-- ppp
