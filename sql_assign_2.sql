-- MYSQL ASSIGNMENT PART-2
use assignment;

select * from employee
where deptno = 10 and salary > 3000;

select count(*) as first_class from students
where marks between 50 and 79;

select count(*) as distinction from students
where marks between 80 and 100;

select distinct city from station where id % 2 = 0;
select * from station;

select COUNT(*) - COUNT(distinct city) as N_N1
from station;

select distinct city
from station
where left(city, 1) in ('a', 'e', 'i', 'o', 'u');

select distinct city
from station
where left(city, 1) in ('a', 'e', 'i', 'o', 'u') and right(city, 1) in ('a', 'e', 'i', 'o', 'u');

select distinct city
from station
where left(city, 1) not in ('a', 'e', 'i', 'o', 'u');

select distinct city
from station
where left(city, 1) not in ('a', 'e', 'i', 'o', 'u') and right(city, 1) not in ('a', 'e', 'i', 'o', 'u');

select concat(first_name, ' ', last_name) as name
from emp
where salary > 2000 and timestampdiff(month, hire_date, now()) < 36
order by salary desc;

select deptno, sum(salary) as total_salary
from employee
group by deptno;

select * from employee;

select count(*) from city where population > 100000;

select * from city;

select sum(population) as total_population
from city
where district = 'California';

select * from city;

select district, avg(population) as avg_population
from city
group by district;

select * from city;

select * from customers;
select * from orders;

select ordernumber, status, customernumber,customername ,comments 
from orders inner join customers
using(customernumber)
where status ="Disputed";

------------------------------------------------------------------------------------------------------------






