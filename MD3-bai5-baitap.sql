create database demo;
use demo;
create table products(
productid int primary key not null auto_increment,
productcode varchar(30) not null,
productname varchar(50) not null,
productprice float not null,
productamount int not null,
productdescription varchar(50),
productstatus bit
);
insert into products(productcode,productname,productprice,productamount,productdescription,productstatus)
values ('pr01','sản phẩm điện tử',10000,100,'sản phẩm dễ vỡ',0),
 ('pr02','sản phẩm điện tử',50000,500,'sản phẩm dễ vỡ',1),
 ('pr03','sản phẩm điện tử',100000,700,'sản phẩm dễ vỡ',0);
select * from products;

alter table products
add unique index productcode_name(productcode);
create index productcode_name on products(productcode);

-- tạo view 
create view vw_products
as select p.productcode,p.productname,p.productprice,p.productstatus
from products p;

-- xoá view
drop view vw_products;

-- tạo procedure
delimiter &&
drop procedure if exists products &&
create procedure products()
begin
select p.productcode,p.productname,p.productprice,p.productstatus
from products p;
end &&
delimiter &&
call products();

-- thêm mới 1 danh mục

delimiter &&
create procedure products(in Status varchar(30))
begin
insert into products(productstatus)
values(status);
end &&
delimiter &&
call products();
