create table lop(
ma int identity,
ten nvarchar(50) not null unique,
primary key(ma)
)

insert into lop(ten)
values ('LT'),('ATTT')
insert into lop(ten)
values ('hacker mu trang')

select * from lop

drop table sinh_vien
create table sinh_vien(
ma int identity,
ten nvarchar(50) not null,
gioi_tinh bit not null default 0,
ma_lop int,
foreign key(ma_lop) references lop(ma),
primary key(ma)
)

insert into sinh_vien(ten, gioi_tinh, ma_lop)
values ('Long',default,1),(N'Tuấn',1,1),(N'Tuấn hacker',1,2)
insert into sinh_vien(ten)
values ('Longsky')

select * from sinh_vien 
inner join lop on lop.ma = sinh_vien.ma_lop

select * from sinh_vien
left join lop on sinh_vien.ma_lop = lop.ma

select * from sinh_vien
left join lop on sinh_vien.ma_lop = lop.ma
where
sinh_vien.ma_lop is null

select 
lop.ma,
count(sinh_vien.ma_lop) as N'số sinh viên'
from sinh_vien
right join lop on sinh_vien.ma_lop = lop.ma
group by lop.ma

select 
*
from sinh_vien
right join lop on sinh_vien.ma_lop = lop.ma