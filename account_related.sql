-- ds5110 restaurant project
-- account related


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



-- create change password






