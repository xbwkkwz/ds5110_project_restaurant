-- account related views, procedures, functions, triggers


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

-- create sign in procedure
delimiter //
create procedure sign_in(in email_var varchar(64), in password_var varchar(64))
begin
select * from customer where email = email_var and customerPassword = password_var;
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

-- create delete customer account
delimiter //
create procedure delete_account (in customerID_var int)
begin
delete from customer where customerID = customerID_var;
select 'Saved.' as message;
end//
delimiter ;

-- view employee info
delimiter //
create procedure view_employee (in occupation_var varchar(64), in filter_var boolean)
begin
select employeeID, concat(firstName, ' ', lastName) as ename, email, phone, ssn, salary, occupation, rating
from employee
where filter_var or (occupation = occupation_var);
end//
delimiter ;

-- create one new employee
delimiter //
create procedure add_employee(in firstName_var varchar(64), in lastName_var varchar(64), in email_var varchar(64), in phone_var varchar(64), in ssn_var varchar(64), in salary_var varchar(64), in occupation_var varchar(64))
begin
insert into employee (firstName, lastName, email, phone, ssn, salary, occupation, rating)
values (firstName_var, lastName_var, email_var, phone_var, ssn_var, salary_var, occupation_var, '5');
select "Saved." as message;
end//
delimiter ;

-- delete one employee
delimiter //
create procedure delete_employee (in employeeID_var int)
begin
delete from employee where employeeID = employeeID_var;
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




