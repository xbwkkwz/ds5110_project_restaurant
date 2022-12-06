/* temp procedures for later updates*/

-- create customer email table
create table customer_email (
customerID int primary key auto_increment,
email varchar(64) not null unique
);

-- create the customer table
create table customer (
customerID int not null,
firstName varchar(64) not null,
lastName varchar(64) not null,
phone varchar(64),
customerPassword varchar(64) not null,
primary key (customerID),
constraint cstomer_fk_cusotmer_email
	foreign key (customerID) references customer_email(customerID) on update cascade on delete cascade
);

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

-- create sign in procedure
delimiter //
create procedure sign_in(in email_var varchar(64), in password_var varchar(64))
begin
select ce.customerID, ce.email, c.firstName, c.lastName, c.phone, c.customerPassword
from customer_email as ce natural join customer as c
where ce.email = email_var and c.customerPassword = password_var;
end//
delimiter ;

-- delete customer account
delimiter //
create procedure delete_account (in customerID_var int)
begin
delete from customer_email where customerID = customerID_var;
select 'Saved.' as message;
end//
delimiter ;


-- create employee email table
create table employee_email (
employeeID int primary key auto_increment,
email varchar(64) not null unique
);

-- create the empyoyee table
create table employee (
employeeID int not null,
firstName varchar(64) not null,
lastName varchar(64) not null,
phone varchar(64),
ssn char(11) unique,
salary decimal(9, 2) check (salary > 0),
occupation enum('Waiter', 'Chef', 'Manager') not null,
rating enum('1', '2', '3', '4', '5'), -- 1 = bad, 5 = good
primary key (employeeID),
constraint employee_fk_employee_email
	foreign key (employeeID) references employee_email(employeeID) on update cascade on delete cascade
);

-- view employee
delimiter //
create procedure view_employee (in occupation_var varchar(64), in filter_var boolean)
begin
select ee.employeeID, concat(e.firstName, ' ', e.lastName) as ename, ee.email, e.phone, e.ssn, e.salary, e.occupation, e.rating
from employee_email as ee natural join employee as e
where filter_var or (e.occupation = occupation_var);
end//
delimiter ;

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

-- delete one employee
delimiter //
create procedure delete_employee (in employeeID_var int)
begin
delete from employee_email where employeeID = employeeID_var;
select 'Saved.' as message;
end//
delimiter ;

-- ---------------------------------------------

-- create the menu category name table
create table menu_category_name (
categoryID int primary key auto_increment,
categoryName varchar(64) not null unique
);

-- create the menu_category table
create table menu_category (
categoryID int not null,
categoryDescription varchar(512),
primary key (categoryID),
constraint menu_category_fk_mcn
	foreign key (categoryID) references menu_category_name(categoryID) on update cascade on delete cascade
);

-- add data to the menu category
insert into menu_category_name (categoryID, categoryName)
values
(1, 'Starters'),
(2, 'Lobster Fra Diavolo'),
(3, 'Black Pasta'),
(4, 'Classics'),
(5, 'Seafood & Linguine'),
(6, 'Fried'),
(7, 'Broiled'),
(8, 'Sides'),
(9, 'Pizza'),
(10, 'Drink');

-- add data to the menu category
insert into menu_category (categoryID, categoryDescription)
values
(1, 'Activate your taste buds'),
(2, 'Seafood chowder'),
(3, 'Fresh homemade black linguine made with squid ink'),
(4, 'Served a la carte'),
(5, 'Cooked from scratch & served in the pan'),
(6, 'Served lightly breaded with fries, onion rings, & tartar'),
(7, 'Crispy topping, olive oil, garlic, romano, breadcrumbs'),
(8, 'Extra and more'),
(9, 'Garlic-seasoned crust with a rich, buttery taste'),
(10, 'Refreshing taste');

-- create new menu category
delimiter //
create procedure add_new_category (in categoryName_var varchar(64))
begin
declare id_var varchar(64);
declare duplicate_name boolean default false;
declare CONTINUE handler for 1062
	set duplicate_name = true;
insert into menu_category_name (categoryName) values (categoryName_var);
select categoryID into id_var from menu_category_name where categoryName = categoryName_var;
insert into menu_category (categoryID) values (id_var);
if duplicate_name = true then
	select 'Error: This category name already exists.' as message;
else
	select 'Saved.' as message;
end if;
end//
delimiter ;

-- create new dish
delimiter //
create procedure add_new_dish (in categoryName_var varchar(64), in dishName_var varchar(64), in price_var decimal(5,2))
begin
declare category_name_not_exist boolean default false;
declare CONTINUE handler for 1048
	set category_name_not_exist = true;
insert into menu (categoryID, dishName, price, dishStatus) 
values ((select categoryID from menu_category_name where categoryName = categoryName_var), dishName_var, price_var, true);
if category_name_not_exist = true then
	select 'Error: This category name does not exist.' as message;
else
	select 'Saved.' as message;
end if;
end//
delimiter ;

-- create the view for the menu for customer
create view menu_for_customer as
select menu.menuID, mcn.categoryName, menu.dishName, menu.price
from menu
natural join menu_category_name as mcn
where dishStatus is true
order by menuID ASC;

-- create a view for the menu for employee
create view menu_for_employee as
select m.menuID, mcn.categoryName, m.dishName, m.dishDescription, m.price, m.dishStatus
from menu as m
natural join menu_category_name as mcn
order by menuID ASC;

-- ---------------------------------------------

-- create ingredient name table
create table ingredient_name (
ingredientID int primary key auto_increment,
ingredientName varchar(64) not null unique
);

-- create the ingredient table
create table ingredient (
ingredientID int not null,
stock int not null default 0 check (stock >= 0),
primary key (ingredientID),
constraint ingredient_fk_ingredient_name
	foreign key (ingredientID) references ingredient_name (ingredientID) on update cascade on delete cascade
);

-- add data to the ingredient_name table
insert into ingredient_name (ingredientID, ingredientName) values
(1, 'Calamari'),
(2, 'Red sauce'),
(3, 'Cherrystone'),
(4, 'Shrimp'),
(5, 'Scampi'),
(6, 'Mussel'),
(7, 'Littleneck'),
(8, 'Romaine'),
(9, 'Crouton'),
(10, 'Tomato'),
(11, 'Cucumber'),
(12, 'Carrot'),
(13, 'Red onion'),
(14, 'Cocktail sauce'),
(15, 'Lobster'),
(16, 'Tomato sauce'),
(17, 'Linguine'),
(18, 'Black pasta'),
(19, 'Alfredo sauce'),
(20, 'Mushroom'),
(21, 'Pepper'),
(22, 'Monkfish'),
(23, 'Marsala sauce'),
(24, 'Salmon'),
(25, 'Swordfish'),
(26, 'Clam sauce'),
(27, 'Scallop'),
(28, 'Broccoli'),
(29, 'Haddock'),
(30, 'Potato'),
(31, 'Cheese'),
(32, 'Pepperoni'),
(33, 'Orange');

-- add data to the ingredient table
insert into ingredient (ingredientID, stock)
values
(1, 500),
(2, 100),
(3, 500),
(4, 500),
(5, 500),
(6, 500),
(7, 500),
(8, 500),
(9, 500),
(10, 500),
(11, 500),
(12, 500),
(13, 500),
(14, 100),
(15, 100),
(16, 500),
(17, 500),
(18, 500),
(19, 500),
(20, 500),
(21, 500),
(22, 100),
(23, 100),
(24, 100),
(25,  100),
(26,  500),
(27,  500),
(28,  500),
(29,  100),
(30,  500),
(31,  500),
(32, 500),
(33, 500);

-- view all ingredient stock
delimiter //
create procedure view_ingredient_stock ()
begin
select ingn.ingredientID, ingn.ingredientName, i.stock
from ingredient_name as ingn natural join ingredient as i
order by ingn.ingredientID ASC;
end//
delimiter ;

-- add new ingredient to the table
delimiter //
create procedure add_new_ingredient (in ingredientName_var varchar(64))
begin
declare duplicate_name boolean default false;
declare CONTINUE handler for 1062
	set duplicate_name = true;
insert into ingredient_name (ingredientName) values (ingredientName_var);
if duplicate_name = true then
	select 'Error: This ingredient already exists.' as message;
else
	select 'Saved.' as message;
end if;
end//
delimiter ;

-- view ingredient for one dish
delimiter //
create procedure view_dish_ingredient (in menuID_var int)
begin
select i.ingredientID, i.ingredientName, dhi.quantity
from ingredient_name as i
join dish_has_ingredient as dhi
on i.ingredientID = dhi.ingredientID
where dhi.menuID = menuID_var;
end//
delimiter ;

-- add ingredient list for one dish
delimiter //
create procedure add_dish_has_ingredient (in dishName_var varchar(64), in ingredientName_var varchar(64), in quantity_var int)
begin
declare name_not_exist boolean default false;
declare CONTINUE handler for 1048
	set name_not_exist = true;
insert into dish_has_ingredient (menuID, ingredientID, quantity) 
values ((select menuID from menu where dishName = dishName_var), 
		(select ingredientID from ingredient_name where ingredientName = ingredientName_var), 
		quantity_var);
if name_not_exist = true then
	select 'Error: The food name does not exist.' as message;
else
	select 'Saved.' as message;
end if;
end//
delimiter ;

-- make one view for inventory table
create view ingredient_inventory as
select inv.inventoryID, ing.ingredientName, inv.quantity, inv.totalCost, e.employeeID, concat(e.firstName, ' ', e.lastName) as employeeName, inv.purchaseDate, inv.expDate
from inventory as inv
natural join ingredient_name as ing
natural join employee as e; 

-- create one function to determine the ingredient id from name
delimiter //
create function find_ingredient_id(ingredientName_var varchar(64))
returns int
deterministic
reads sql data
begin
declare ingredientID_var int;
select ingredientID into ingredientID_var from ingredient_name where ingredientName = ingredientName_var;
return ingredientID_var;
end//
delimiter ;

-- add purchase to the inventory table
delimiter //
create procedure add_inventory (in ingredientName_var varchar(64), in quantity_var int, in totalCost_var decimal(6,2), in employeeID_var int, in purchaseDate_var date, in expDate_var date)
begin
declare name_not_exist boolean default false;
declare CONTINUE handler for 1048
	set name_not_exist = true;
insert into inventory (ingredientID, quantity, totalCost, employeeID, purchaseDate, expDate)
values (find_ingredient_id(ingredientName_var), quantity_var, totalCost_var, employeeID_var, purchaseDate_var, expDate_var);
if name_not_exist = true then
	select 'Error: The ingredient name does not exist.' as message;
else
	select 'Saved.' as message;
end if;
end//
delimiter ;
