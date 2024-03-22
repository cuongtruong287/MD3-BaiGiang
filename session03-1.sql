create database qlbh_fk;
use qlbh_fk;
create table category(
	id int primary key auto_increment,
    category_name varchar(50) not null unique,
    status bit(1) default 1
);
create table product(
	id int primary key auto_increment,
    product_name varchar(100) not null unique,
    price float check (price > 0),
    sale_price float,
    check(sale_price < price and sale_price >0),
	category_id int not null,
    foreign key(category_id) references category(id)
);

insert into category(category_name,status) values 
('áo',0),
('quần',1);

select * from category;
insert into product(product_name,price,sale_price,category_id) values
('mũ lưỡi trai',10,5,1),
('quần bò',20,10,2),
('mũ cối',10,2,1);
select*from product;
-- select where 
-- lấy ra sản phẩm có giá lớn hơn mười 
select * from product where price > 10;
-- lấy ra sản phẩm có id = 6 
select * from product where id = 6;
-- lấy ra các sản phẩm có category khác bằng 2 
select * from product where category_id <> 2;
select * from product where category_id != 2;
-- lấy ra sản phẩm có giá km lớn hơn 0 và giá < 20 
select * from product where price <20 AND sale_price >0;
-- lấy ra sản phẩm có giá trong khoản từ 3 đến 10 
select * from product where price  between 3 and 10;
select * from product where price >= 3 and price <= 10;

-- lấy ra danh sách sản phẩm có id = 4,6,7
select * from product where id in (4,6,7);
-- lấy ra danh sách sản phẩm khác id = 4,6,7
select * from product where id not in (4,6,7);

-- lấy ra sản phẩm có tên bắt đầu bằng chữ m 
select * from product where product_name like 'm%';

-- lấy ra sản phẩm có tên chứa từ n
select * from product where product_name like '%mũ%';

-- lấy ra sản phẩm có tên kết thúc bằng ký tự i
select * from product where product_name like '%i';



select * from product order by id asc;
-- lấy ra danh sách sản phẩm và sắp xếp giá sản phẩm tằng dần
select * from product order by price asc;
-- lấy ra danh sách sản phẩm và sắp xếp giá sản phẩm giảm dần
select * from product order by price desc;
-- lấy ra 2 bản ghi của bảng sản phẩm 
select * from product limit 2;

select * from product limit 2 offset 0;
select * from product limit 2 offset 2;

select * from product limit 2 offset 1;