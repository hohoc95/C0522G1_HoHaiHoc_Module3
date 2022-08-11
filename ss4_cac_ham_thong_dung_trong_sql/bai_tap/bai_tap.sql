use nhap_lieu_quan_ly_sinh_vien;


select *, max(credit)from subjects;

select *, max(mark) from mark
right join subjects on subjects.sub_id = mark.sub_id;


select s.*, avg(m.mark) as diem_trung_binh from student s
right join mark m on m.student_id = s.student_id
group by student_id
order by m.mark desc;