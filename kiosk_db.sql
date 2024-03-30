use mysql;

create user 'kiosk'@'%' identified by 'kiosk';
grant all privileges on kiosk_db.* to 'kiosk'@'%' ;

create database kiosk_db
default character set utf8mb4
collate utf8mb4_general_ci;
    
use kiosk_db;

CREATE TABLE product (
   no int auto_increment primary key,
   category   varchar(100),
   name   varchar(100),
   price   int
);

CREATE TABLE images (
   product_no   int   not null,
   org_name   varchar(500),
   save_name   varchar(500),
   file_path   varchar(500),
	CONSTRAINT images_fk FOREIGN KEY (product_no)
   REFERENCES product(no)
);

CREATE TABLE cart (
   product_no   int not null,
   date date,
	CONSTRAINT cart_fk FOREIGN KEY (product_no)
   REFERENCES product(no)
);

CREATE TABLE users (
   no   int not null unique auto_increment,
   hp   varchar(100),
   point   int
);

