-- tạo csdl 
create database qls;
use qls;
-- tạo bảng tác giả 
create table author(
	id int primary key auto_increment,
    fullName varchar(100) not null,
    birthday date
);
-- tạo bảng sách 
create table book(
	id int primary key auto_increment,
    bookName varchar(100) unique,
    price float check (price > 0),
    year_making int,
    author_id int not null,
    foreign key(author_id) references author(id)
);

-- thêm mới dữ liệu 
insert into author(fullName,birthday) value('Nguyễn Du','1992/01/01');
insert into author(fullName,birthday) value('Nguyễn Du','1992-01-01');
select * from author;
insert into book(bookName,price,year_making,author_id) value ('Truyện Kiều',100,1987,2);
insert into book(bookName,price,year_making,author_id) value ('Truyện Kiều 2',50,1987,2);
insert into book(bookName,price,year_making,author_id) value ('Tryện tấm cám',50,1987,1);
select * from book;
-- cập nhật tên tác giả có id = 2
UPDATE author SET fullName = 'Hồng Ngọc',birthday='2000-09-09' where id = 2;
-- cập nhật năm xuất bản của sách có tên là truyện kiều 2 thành 2021 
update book set year_making = 2021 where bookName = 'Truyện Kiều 2';
-- xóa sách có id = 5 
delete from book where id = 5;
delete from book where author_id = 2;
