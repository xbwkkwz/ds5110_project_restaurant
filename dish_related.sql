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
declare row_not_found tinyint default false;
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












