-- dish related views, procedures, functions, triggers


-- create the view for the menu for customer
create view menu_for_customer as
select menu_category.categoryName, menu.menuID, menu.dishName, menu.dishDescription, menu.price
from menu
natural join menu_category
where dishStatus is true
order by menuID ASC;

-- get the menu info for customer
delimiter //
create procedure customer_view_menu()
begin
select * from menu_for_customer;
end//
delimiter ;

-- create a view for the menu for employee
create view menu_for_employee as
select mc.categoryName, m.menuID, m.dishName, m.dishDescription, m.price, m.dishStatus
from menu as m
natural join menu_category as mc
order by menuID ASC;

-- get the menu info for employee
delimiter //
create procedure employee_view_menu()
begin
select * from menu_for_employee;
end//
delimiter ;

-- find dish name and price for the cart
delimiter //
create procedure get_dish_name_price(in menuID_var int)
begin
select dishName, price
from menu where menuID = menuID_var;
end//
delimiter ;

-- create one view for dish ingredient
create view order_dish_ingredient as
select ol.orderID, ol.listID, ol.menuID, ol.quantity as dishQuantity, dhi.ingredientID, dhi.quantity as ingredientQuantity
from order_list as ol
join dish_has_ingredient as dhi
on ol.menuID = dhi.menuID;

-- create a function to determine current ingredient stock
delimiter //
create function check_stock(ingredientID_var int)
returns int
not deterministic
reads sql data
begin
declare old_stock int;
select stock into old_stock from ingredient where ingredientID = ingredientID_var;
return old_stock;
end//
delimiter ;

-- create a function to update ingredient stock
delimiter //
create function calculate_stock(orderID_var int, menuID_var int, ingredientID_var int)
returns int
not deterministic
reads sql data
begin
declare new_stock int;
select check_stock(ingredientID_var) - dishQuantity * ingredientQuantity into new_stock
from order_dish_ingredient where orderID = orderID_var and menuID = menuID_var and ingredientID = ingredientID_var;
return new_stock;
end//
delimiter ;

-- create a trigger to update ingredient stock
delimiter //
create trigger update_ingredient_stock after insert on order_queue
for each row
begin
declare orderID_var int;
declare menuID_var int;
declare ingredientID_var int;
declare row_not_found boolean default false;
declare ingredient_cursor cursor for
	select orderID, menuID, ingredientID from order_dish_ingredient where orderID = NEW.orderID;
declare EXIT handler for not found
	set row_not_found = true;
open ingredient_cursor;
while row_not_found = false do
	fetch ingredient_cursor into orderID_var, menuID_var, ingredientID_var;
	update ingredient set stock = calculate_stock(orderID_var, menuID_var, ingredientID_var) where ingredientID = ingredientID_var;
end while;
close ingredient_cursor;
end//
delimiter ;

-- create new menu category
delimiter //
create procedure add_new_category (in categoryName_var varchar(64))
begin
declare duplicate_name boolean default false;
declare CONTINUE handler for 1062
	set duplicate_name = true;
insert into menu_category (categoryName) values (categoryName_var);
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
values ((select categoryID from menu_category where categoryName = categoryName_var), dishName_var, price_var, true);
if category_name_not_exist = true then
	select 'Error: This category name does not exist.' as message;
else
	select 'Saved.' as message;
end if;
end//
delimiter ;

-- update dish status
delimiter //
create procedure update_dish_status (in menuID_var int, in dishStatus_var boolean)
begin
update menu set dishStatus = dishStatus_var where menuID = menuID_var;
select 'Saved.' as message;
end//
delimiter ;

-- update dish price
delimiter //
create procedure update_dish_price (in menuID_var int, in price_var boolean)
begin
update menu set price = price_var where menuID = menuID_var;
select 'Saved.' as message;
end//
delimiter ;

-- update dish price
delimiter //
create procedure update_dish_description (in menuID_var int, in description_var varchar(512))
begin
update menu set dishDescription = description_var where menuID = menuID_var;
select 'Saved.' as message;
end//
delimiter ;

-- view all ingredient stock
delimiter //
create procedure view_ingredient_stock ()
begin
select * from ingredient;
end//
delimiter ;

-- add new ingredient to the table
delimiter //
create procedure add_new_ingredient (in ingredientName_var varchar(64))
begin
declare duplicate_name boolean default false;
declare CONTINUE handler for 1062
	set duplicate_name = true;
insert into ingredient (ingredientName) values (ingredientName_var);
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
from ingredient as i
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
		(select ingredientID from ingredient where ingredientName = ingredientName_var), 
		quantity_var);
if name_not_exist = true then
	select 'Error: The food name does not exist.' as message;
else
	select 'Saved.' as message;
end if;
end//
delimiter ;





