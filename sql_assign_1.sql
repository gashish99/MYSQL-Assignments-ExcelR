-- MYSQL ASSIGNMENT PART-1
create database assignment;

create table countries(name varchar(30) not null, 
population int not null, 
capital varchar(30) not null);

insert into countries values('China',1382,'Beijing'),
('India',1326,'Delhi'),
('United States',324,'Washington D.C.'),
('Indonesia',260,'Jakarta'),
('Brazil',209,'Brasilia'),
('Pakistan',193,'Islamabad'),
('Nigeria',187,'Abuja'),
('Bangladesh',163,'Dhaka'),
('Russia',143,'Moscow'),
('Mexico',128,'Mexico City'),
('Japan',126,'Tokyo'),
('Philippines',102,'Manila'),
('Ethiopia',101,'Addis Ababa'),
('Vietnam',94,'Hanoi'),
('Egypt',93,'Cairo'),
('Germany',81,'Berlin'),
('Iran',80,'Tehran'),
('Turkey',79,'Ankara'),
('Congo',79,'Kinshasa'),
('France',64,'Paris'),
('United Kingdom',65,'London'),
('Italy',60,'Rome'),
('South Africa',55,'Pretoria'),
('Myanmar',54,'Naypyidaw');

insert into countries values('Sri Lanka',80,'Colombo'),
('Cuba',40,'Havana'),
('Canada',120,'Ottawa'),
('South Korea',100,'Seoul'),
('Spain',56,'Madrid');

set SQL_SAFE_UPDATES=0;

update countries
set capital= 'New Delhi'
where name = 'India';

alter table countries rename big_countries;

create table product(
product_id int unsigned primary key auto_increment,
product_name varchar(30) not null unique,
product_description varchar(200),
supplier_id int unsigned,
constraint product_fk foreign key (supplier_id) references suppliers(suppliers_id));

alter table product
auto_increment= 100;

create table suppliers(
suppliers_id int unsigned primary key auto_increment,
supplier_name varchar(30),
location varchar(30));

alter table suppliers
auto_increment = 500;

create table stock(
id int unsigned primary key auto_increment,
product_id int unsigned,
balance_stock int,
constraint stock_fk foreign key (product_id) references product(product_id));

alter table stock
auto_increment = 1000;

insert into product(product_name,product_description,supplier_id) values
('iPhone 13', 'apple smartphone with improved camera and battery life',null),
('samsung galaxy S21', 'android smartphone with 5G connectivity and high-resolution display',null),
('amazon echo dot', 'smart speaker with alexa voice assistant',null),
('sony playStation 5', 'next-gen gaming console with powerful graphics',null),
('fitbit Charge 5', 'fitness tracker with heart rate monitoring and GPS',null);

insert into suppliers(supplier_name, location) values
('Apple Inc.', 'California'),('Samsung Electronics Co., Ltd.', 'South Korea'),('Amazon Inc.', 'Washington'),('Sony Corporation', 'Japan'),
('Fitbit Inc.', 'California');

insert into  stock(balance_stock) values
(100),(75),(50),(200),(15);

select * from product;
select * from suppliers;
select * from stock;

select constraint_name, column_name, referenced_table_name, referenced_column_name
from information_schema.key_column_usage
where table_name = 'stock';

alter table suppliers
modify supplier_name varchar(35) unique not null;

alter table emp
add column dept_no int unsigned;
select * from emp;
set SQL_SAFE_UPDATES=0;

update emp
set dept_no = 
case
when emp_no % 2 = 0 then 20 
when emp_no % 3 = 0 then 30 
when emp_no % 4 = 0 then 40 
when emp_no % 5 = 0 then 50 
else 10 
end;

create unique index emp_no_index on emp (emp_no);

create view emp_sal as
select emp_no, first_name, last_name, salary
from emp
order by salary desc;

select * from emp_sal;

---------------------------------------------------------------------------------------------------






