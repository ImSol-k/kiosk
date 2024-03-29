create user 'kiosk'@'%' identified by 'kiosk';

create database kiosk_db
	default character set utf8mb4
	collate utf8mb4_general_ci
	default encryption='n';

grant all privileges on kiosk_db.* to 'kiosk'@'%' ;