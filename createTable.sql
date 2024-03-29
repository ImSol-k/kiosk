drop table product;
drop table image;
drop table users;

#카테고리
create table category(
	no int auto_increment primary key,
    name varchar(200) not null
);
insert into category values(null,'coffee');

#제품테이블
create table product (
	no int auto_increment primary key, #제품번호
    name varchar(200) not null,	#제품이름
    price int not null, #제품가격
    count int,	#제품수량
    category_no int not null,
    constraint product_fk foreign key(category_no) references category(no)
);
insert into product values(null, '제품이름', 0, 0, 1);

#제품이미지
create table image(
	no int auto_increment primary key, #이미지번호
    product_no int not null,	#제품번호(fk)
    name varchar(200),	#이미지이름
    org_name varchar(500),	#원본이름
    save_name varchar(500),	#저장이름
    file_path varchar(500),	#저장경로
    constraint image_fk foreign key(product_no) references product(no)
);
insert into image values(null, 1, '이미지이름', '원본이름', '저장이름', '저장경로');

#유저테이블
create table users(
	no int auto_increment primary key,	#유저번호
    hp varchar(200) not null,	#핸드폰번호
    point int	#적립포인트
);
insert into users values(null, '010-2222-3333', 10);

select * from category;
select * from product;
select * from image;
select * from users;


show tables;