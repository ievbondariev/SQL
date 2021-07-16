CREATE TABLE IF NOT EXISTS clients ( 
id serial
CONSTRAINT clients_pk PRIMARY KEY,
name varchar(20),
email varchar(255) UNIQUE NOT NULL,
phone bigint UNIQUE NOT NULL,
about varchar
);

CREATE TABLE IF NOT EXISTS statuses (
id serial
CONSTRAINT statuses_pk PRIMARY KEY,	
alias varchar(15) UNIQUE NOT NULL,
description varchar NOT NULL
);

CREATE TABLE IF NOT EXISTS client_status (
client_id int NOT NULL,
	status_id int NOT NULL
);

CREATE TABLE IF NOT EXISTS accounts (
id serial
CONSTRAINT accounts_pk PRIMARY KEY,
client_id int NOT NULL,
number varchar(20) UNIQUE NOT NULL,
	value double precision NOT NULL
);

INSERT INTO clients (name, email, phone, about) VALUES ('Ivan', 'ivan@ukr.net', 380958089090, 'new client');
INSERT INTO clients (name, email, phone, about) VALUES ('Ali', 'alex@ukr.net', 380958089091, 'new client');
INSERT INTO clients (name, email, phone, about) VALUES ('Baba', 'baba@ukr.net', 380958089092, 'new client');
INSERT INTO clients (name, email, phone, about) VALUES ('Peter', 'peter@ukr.net', 380958089093, 'new client');
INSERT INTO clients (name, email, phone) VALUES ('Ira', 'ira@ukr.net', 380958089094);
INSERT INTO clients (name, email, phone, about) VALUES ('Ikea', 'ikea@ukr.net', 380958089095, 'new client');
INSERT INTO clients (name, email, phone, about) VALUES ('Irak', 'irak@ukr.net', 380958089096, 'new client');
INSERT INTO clients (name, email, phone, about) VALUES ('Ildar', 'ilda@ukr.net', 380958089097, 'new client');
INSERT INTO clients (name, email, phone, about) VALUES ('Injir', 'inj@ukr.net', 380958089098, 'new client');
INSERT INTO clients (name, email, phone) VALUES ('Ivan', 'alex1@ukr.net', 380958089099);


INSERT INTO statuses (alias, description) VALUES ('STANDART', 'VISA');
INSERT INTO statuses (alias, description) VALUES ('PREMIUM', 'VISA GOLD');
INSERT INTO statuses (alias, description) VALUES ('BUSINESS', 'MASTERCARD PLATINUM');

INSERT INTO client_status (client_id, status_id) VALUES (1, 1);
INSERT INTO client_status (client_id, status_id) VALUES (2, 1);
INSERT INTO client_status (client_id, status_id) VALUES (3, 2);
INSERT INTO client_status (client_id, status_id) VALUES (4, 1);
INSERT INTO client_status (client_id, status_id) VALUES (5, 2);
INSERT INTO client_status (client_id, status_id) VALUES (6, 1);
INSERT INTO client_status (client_id, status_id) VALUES (7, 2);
INSERT INTO client_status (client_id, status_id) VALUES (8, 1);
INSERT INTO client_status (client_id, status_id) VALUES (9, 3);
INSERT INTO client_status (client_id, status_id) VALUES (10, 1);

INSERT INTO accounts (client_id, number, value) VALUES (1, 'UA2132231300000260', 1000.00);
INSERT INTO accounts (client_id, number, value) VALUES (2, 'UA2132231300000278', 18000.00);
INSERT INTO accounts (client_id, number, value) VALUES (3, 'UA2132231300000298', 190000.00);
INSERT INTO accounts (client_id, number, value) VALUES (4, 'UA2132231300000255', 19000.00);
INSERT INTO accounts (client_id, number, value) VALUES (5, 'UA2132231300000266', 220000.00);
INSERT INTO accounts (client_id, number, value) VALUES (6, 'UA21322313000002500', 15000.00);
INSERT INTO accounts (client_id, number, value) VALUES (7, 'UA213223130000026890', 95000.00);
INSERT INTO accounts (client_id, number, value) VALUES (8, 'UA213223130000026090', 10000.00);
INSERT INTO accounts (client_id, number, value) VALUES (9, 'UA213223130000026560', 800500.00);
INSERT INTO accounts (client_id, number, value) VALUES (10, 'UA213223130000026780', 5000.00);

select * from clients where phone=380958089090;

select alias, description from statuses;

select number from accounts where value > 1000.00;

select * from clients where length ( name ) > 7;

select name, phone, about from clients where name is NOT NULL and phone > 380951111111 and about is NOT NULL;

select * from clients where  starts_with (email, 'alex');

select * from clients ORDER BY (-phone);

select * from clients AS c INNER JOIN accounts a ON c.id = a.client_id;

select c.name, c.email, c.phone,  s.alias from clients AS c INNER JOIN 
client_status cs ON c.id = cs.client_id INNER JOIN statuses s ON cs.status_id = s.id;