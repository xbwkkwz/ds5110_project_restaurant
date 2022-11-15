-- ds5110 restaurant project
-- order related

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
select mc.categoryName, mc.categoryDescription, m.menuID, m.dishName, m.dishDescription, m.price, m.dishStatus
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

-- check order in queue status
delimiter //
create procedure check_order_in_queue (in orderID_var int)
begin
select orderInQueue from orders where orderID = orderID_var;
end//
delimiter ;

-- update orders status
delimiter //
create procedure update_order_status (in orderID_var int, in status_var varchar(64))
begin
update orders set orderStatus = status_var where orderID = orderID_var;
end//
delimiter ;

-- view one order detail
delimiter //
create procedure view_order_detail (in orderID_var int)
begin
select ol.menuID, m.dishName, ol.quantity, m.price, ol.quantity*m.price as subtotal
from order_list as ol
natural join menu as m
where ol.orderID = orderID_var;
end//
delimiter ;

-- customer view all order history
delimiter //
create procedure customer_view_order_history (in customerID_var int)
begin
select orderID, orderDate, orderStatus, numOfDish, subtotal, tips, total
from orders
where customerID = customerID_var
order by orderID ASC;
end//
delimiter ;

-- employee view all order history
delimiter //
create procedure employee_view_order_history ()
begin
select orderID, orderDate, orderStatus, orderInQueue, numOfDish, subtotal, tips, total, customerID, tableID
from orders
order by orderID ASC;
end//
delimiter ;

-- assign a table to one order
delimiter //
create procedure assign_table (in orderID_var int, in tableID_var int)
begin
update orders set tableID = tableID_var where orderID = orderID_var;
end//
delimiter ;

-- 











