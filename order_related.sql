-- ds5110 restaurant project
-- order related

-- get the menu info for customer
delimiter //
create procedure customer_view_menu()
begin
select menu_category.categoryName, menu.menuID, menu.dishName, menu.dishDescription, menu.price
from menu
natural join menu_category
where dishStatus is true
order by menuID ASC;
end//
delimiter ;

-- get the menu info for employee
delimiter //
create procedure employee_view_menu()
begin
select menu_category.categoryName, menu.menuID, menu.dishName, menu.dishDescription, menu.price, menu.dishStatus
from menu
natural join menu_category
order by menuID ASC;
end//
delimiter ;

-- find dish name and price for the cart
delimiter //
create procedure get_menu_info(in menuID_var int)
begin
select dishName, price
from menu where menuID = menuID_var;
end//
delimiter ;

-- create one order record
delimiter //
create procedure create_order(in customerID_var int, in numOfDish_var int, in subtotal_var decimal(6,2))
begin
insert into orders (orderDate, orderTime, orderStatus, orderInQueue, numOfDish, subtotal, tips, total, customerID)
values
(current_date(), current_time(), "Received", 0, numOfDish_var, subtotal_var, 0, subtotal_var, customerID_var);
select max(orderID) from orders;
end//
delimiter ;

-- insert order dish into order_list
delimiter //
create procedure create_order_list (in orderID_var int, in listID_var int, in menuID_var int, in quantity_var int)
begin
insert into order_list (orderID, listID, menuID, quantity)
values
(orderID_var, listID_var, menuID_var, quantity_var);
end//
delimiter ;




