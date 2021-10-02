CREATE TABLE animal(
	code int identity,
	nname nvarchar(20) not null unique,
	nfeet int default 0 not null,
	age int not null,
	habitat nvarchar(50) not null,
	ma_moi_truong_song int not null,
	constraint CK_ten check(len(nname) > 2),
	constraint CK_nfeet check(nfeet >= 0 and nfeet < 100 and nfeet % 2 = 0),
	constraint CK_age check(age > 0),
	foreign key ma_moi_truong_song references habitat(ma),
	primary key(code)
)

insert into animal(nname, nfeet, age, habitat)
values (N'cún', 4, 20, N'trong nha'),(N'mèo anh lông ngắn', 4, 10, N'trong nha'), (N'cá chê',default, 6, N'dưới nước')

--thong ke theo so chan
select count(*) as so_con
from animal
where nfeet = 4

--thong ke theo moi truong song
select habitat, count(*) as so_con 
from animal 
group by habitat

-- thong ke tuong ung voi so chan theo moi truong
select habitat, nfeet from animal 
group by habitat, nfeet


create table habitat (
ma int identity,
ten nvarchar(50) not null unique,
primary key(ma)
)