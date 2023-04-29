-- MYSQL ASSIGNMENT PART-3

use assignment;

delimiter //
create procedure order_status(in month int,year int)
begin
select orderNumber, orderDate, status from orders where month(orderDate)=month and year(orderDate)=year;
End //
delimiter ;

call order_status(03,2003);

---------------------------------------
 
delimiter //
create function purchase_stat(
cid int
) 
returns varchar(20)
deterministic
begin
    declare stat varchar(20);
    declare credit numeric;
    set credit = (select sum(Amount) from Payments where customerNumber = cid);

    if credit > 50000 then
        set stat = 'platinum';
    elseif (credit >= 25000 and 
            credit <= 50000) then
        set stat = 'gold';
    elseif credit < 25000 then
        set stat = 'silver';
    end if;
    return (stat);
end //
delimiter ;

select purchase_stat(112) as customer_purchase_status;

select * from payments;

---------------------------------------------------------------

select 
customerNumber, 
customerName, 
purchase_stat(customerNumber) AS purchase_status
from customers;

----------------------------------------------------------------
set SQL_SAFE_UPDATES=0;

delimiter //
create trigger movie_update after update on movies for each row 
begin
update rentals set movieid =new.id where movieid=old.id;
end //
DELIMITER ;

show triggers;

update movies set id=12 where title='Alvin and the Chipmunks';

delimiter //
create trigger delete_movie after delete on movies for each row
begin
delete from rentals where movieid=old.id;
end //
delimiter ;

select * from movies;
select * from rentals;

show triggers;

delete from movies where title='GIA';

select * from movies;
select * from rentals;

----------------------------------------------

select fname as 'First Name' from employee order by salary desc limit 1 offset 2;

select * from employee;

----------------------------------------------
select * from employee;

select *,
rank() over (order by salary desc) 'Rank by Salary'
from employee;

------------------------------------------------------------------------------------------------------------------------------------------------


