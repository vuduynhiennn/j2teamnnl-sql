create table class(
ma int identity,
name nvarchar(50) not null unique,
primary key(ma)
)

create table student(
ma int  identity, 
ten nvarchar(50) not null,
ma_lop int,
foreign key(ma_lop) references class(ma),
primary key(ma),
constraint CK_ten check(len(ten) >=2)
)

insert into class(name)
values (N'Lập trình'), (N'Kinh tế'), (N'Marketing')

insert into student(ten, ma_lop)
values (N'Vu Duy Nhien', 1), (N'Vu Duy Dinh', 2), (N'Vu Duy Phung', 1), (N'Vu Duy Long', 3)

select
student.ma,
student.ten,
classs.ma as N'Chuyên ngành'
from student
join name on class.ma = student.ma
