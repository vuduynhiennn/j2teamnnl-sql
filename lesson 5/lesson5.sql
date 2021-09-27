CREATE TABLE student
(
    ma int identity,
    name nvarchar(20) not null,
    ngay_sinh date not null,
    gioi_tinh bit default 0,
    ngay_vao_lam date default getdate(),
    nghe_nghiep nvarchar(40) not null,
    luong int,
    CONSTRAINT CK_luong check(luong >= 0),
    CONSTRAINT CK_do_dai_ten check(len(name) >= 2),
    CONSTRAINT CK_tuoi check(year(getdate()) - year(ngay_sinh) >= 18),
    CONSTRAINT CK_nghe_nghiep check(nghe_nghiep in(N'IT', N'BUSINESS')),
    PRIMARY KEY(ma)
)

INSERT INTO student (name, ngay_sinh, gioi_tinh, ngay_vao_lam, nghe_nghiep, luong)
VALUES ('Vu Duy Linh', '2003-01-01', 1, '2019-10-02', 'IT', 800000000), ('Vu Duy Lan', '2003-01-01', 1, '2019-10-02', 'IT', 800000000), ('Vu Duy Nam', '2003-01-01', 1, '2019-10-02', 'IT', 800000000), ('Vu Duy Phuong', '2003-01-01', 1, '2019-10-02', 'IT', 800000000), ('Vu Duy Hoa', '2003-01-01', 1, '2019-10-02', 'IT', 800000000), ('Vu Duy Hong', '2003-01-01', 1, '2019-10-02', 'IT', 800000000), ('Vu Duy Chung', '2003-01-01', 1, '2019-10-02', 'IT', 800000000), ('Vu Duy Viet', '2003-01-01', 1, '2019-10-02', 'IT', 800000000), ('Vu Duy Thanh', '1992-01-01', 1, '2019-10-02', 'IT', 800000000)\

update student set luong = 100 where MONTH(ngay_sinh) = MONTH(getdate())

SELECT * from student WHERE MONTH(ngay_sinh) = MONTH(getdate())

update student set luong += 100 

delete from student where luong < 50 and 

delete from student where   MONTH(getdate() - MONTH(ngay_vao_lam)) < 2

DATEDIFF(MONTH, ngay_vao_lam, getdate()) < 2 AND ngay_vao_lam < GETDATE()

SELECT sum from student 

SELECT nghe_nghiep, sum(luong) from student group by nghe_nghiep
SELECT nghe_nghiep, avg(luong) from student group by nghe_nghiep

-- khai niem offset trong sql
select * from student 
ORDER by ngay_vao_lam asc
OFFSETS 3 ROWS
FETCH NEXT 3 rows ONLY;

select ten, sum(luong)  from student
GROUP BY ten, gioi_tinh 
