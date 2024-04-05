use mysql;

drop table sales;
drop table bill;

create user 'kiosk'@'%' identified by 'kiosk';
grant all privileges on kiosk_db.* to 'kiosk'@'%' ;

create database kiosk_db
default character set utf8mb4
collate utf8mb4_general_ci;
use kiosk_db;

-- 제품테이블
CREATE TABLE product (
   no int auto_increment primary key,
   category   varchar(100),
   name   varchar(100),
   price   int
);

-- 유저테이블
CREATE TABLE users (
   no   int not null unique auto_increment,
   hp   varchar(100),
   point   int
);

-- 이미지테이블
CREATE TABLE images (
	product_no   int unique  not null,
	org_name   varchar(500),
	save_name   varchar(500),
	file_path   varchar(500)
);
drop table images;

drop table bill;
-- 영수증테이블
CREATE TABLE bill (
	order_no int auto_increment primary key,
    order_date date not null,
    total int not null,
    user_no int,
    point int
);
drop table sales;
-- 매출테이블
CREATE TABLE sales (
	sales_no int auto_increment primary key,
	product_no   int not null,
    order_no int not null,
	count int not null,
    constraint sales_fk2 foreign key (order_no)
    references bill(order_no)
);
ALTER TABLE product AUTO_INCREMENT=1;
drop table sales;