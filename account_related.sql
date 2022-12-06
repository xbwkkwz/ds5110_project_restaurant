-- account related views, procedures, functions, triggers


/*
-- create one new customer account
delimiter //
create procedure sign_up(in firstName_var varchar(64), in lastName_var varchar(64), in email_var varchar(64), in phone_var varchar(64), in password_var varchar(64))
begin
insert into customer (firstName, lastName, email, phone, customerPassword)
values (firstName_var, lastName_var, email_var, phone_var, password_var);
-- get new user id
select customerID from customer where email = email_var;
end//
delimiter ;
*/

-- create one new customer account
delimiter //
create procedure sign_up(in firstName_var varchar(64), in lastName_var varchar(64), in email_var varchar(64), in phone_var varchar(64), in password_var varchar(64))
begin
declare customerID_var int;
-- get one id first
insert into customer_email (email) values (email_var);
select customerID into customerID_var from customer_email where email = email_var;
-- insert other stuff
insert into customer (customerID, firstName, lastName, phone, customerPassword)
values (customerID_var, firstName_var, lastName_var, phone_var, password_var);
-- return the id
select customerID_var;
end//
delimiter ;

/*
-- create sign in procedure
delimiter //
create procedure sign_in(in email_var varchar(64), in password_var varchar(64))
begin
select * from customer where email = email_var and customerPassword = password_var;
end//
delimiter ;
*/

-- create sign in procedure
delimiter //
create procedure sign_in(in email_var varchar(64), in password_var varchar(64))
begin
select ce.customerID, c.firstName, c.lastName, ce.email, c.phone, c.customerPassword
from customer_email as ce natural join customer as c
where ce.email = email_var and c.customerPassword = password_var;
end//
delimiter ;

-- create change phone number
delimiter //
create procedure change_phone (in customerID_var int, in phone_var varchar(64))
begin
update customer set phone = phone_var where customerID = customerID_var;
select 'Saved.' as message;
end//
delimiter ;

-- create change password
delimiter //
create procedure change_password (in customerID_var int, in password_var varchar(64))
begin
update customer set customerPassword = password_var where customerID = customerID_var;
select 'Saved.' as message;
end//
delimiter ;

/*
-- create delete customer account
delimiter //
create procedure delete_account (in customerID_var int)
begin
delete from customer where customerID = customerID_var;
select 'Saved.' as message;
end//
delimiter ;
*/

-- delete customer account
delimiter //
create procedure delete_account (in customerID_var int)
begin
delete from customer_email where customerID = customerID_var;
select 'Saved.' as message;
end//
delimiter ;

/*
-- view employee info
delimiter //
create procedure view_employee (in occupation_var varchar(64), in filter_var boolean)
begin
select employeeID, concat(firstName, ' ', lastName) as ename, email, phone, ssn, salary, occupation, rating
from employee
where filter_var or (occupation = occupation_var);
end//
delimiter ;
*/

-- view employee
delimiter //
create procedure view_employee (in occupation_var varchar(64), in filter_var boolean)
begin
select ee.employeeID, concat(e.firstName, ' ', e.lastName) as ename, ee.email, e.phone, e.ssn, e.salary, e.occupation, e.rating
from employee_email as ee natural join employee as e
where filter_var or (e.occupation = occupation_var)
order by ee.employeeID ASC;
end//
delimiter ;

/*
-- create one new employee
delimiter //
create procedure add_employee(in firstName_var varchar(64), in lastName_var varchar(64), in email_var varchar(64), in phone_var varchar(64), in ssn_var varchar(64), in salary_var varchar(64), in occupation_var varchar(64))
begin
insert into employee (firstName, lastName, email, phone, ssn, salary, occupation, rating)
values (firstName_var, lastName_var, email_var, phone_var, ssn_var, salary_var, occupation_var, '5');
select "Saved." as message;
end//
delimiter ;
*/

-- create one new employee
delimiter //
create procedure add_employee(in firstName_var varchar(64), in lastName_var varchar(64), in email_var varchar(64), in phone_var varchar(64), in ssn_var varchar(64), in salary_var varchar(64), in occupation_var varchar(64))
begin
declare employeeID_var int;
-- get id first
insert into employee_email (email) values (email_var);
select employeeID into employeeID_var from employee_email where email = email_var;
-- insert other stuff
insert into employee (employeeID, firstName, lastName, phone, ssn, salary, occupation, rating)
values (employeeID_var, firstName_var, lastName_var, phone_var, ssn_var, salary_var, occupation_var, '5');
select "Saved." as message;
end//
delimiter ;

/*
-- delete one employee
delimiter //
create procedure delete_employee (in employeeID_var int)
begin
delete from employee where employeeID = employeeID_var;
select 'Saved.' as message;
end//
delimiter ;
*/

-- delete one employee
delimiter //
create procedure delete_employee (in employeeID_var int)
begin
delete from employee_email where employeeID = employeeID_var;
select 'Saved.' as message;
end//
delimiter ;

-- update the salary of one employee
delimiter //
create procedure update_salary(in employeeID_var int, in salary_var decimal(9,2))
begin
update employee set salary = salary_var
where employeeID = employeeID_var;
select "Saved." as message;
end//
delimiter ;

-- rate one employee
delimiter //
create procedure rate_employee(in employeeID_var int, in rating_var varchar(64))
begin
update employee set rating = rating_var
where employeeID = employeeID_var;
select "Saved." as message;
end//
delimiter ;




