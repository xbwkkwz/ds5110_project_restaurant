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
select employeeID, concat(firstName, ' ', lastName) as ename, occupation
from employee
where filter_var or (occupation = occupation_var);
end//
delimiter ;


