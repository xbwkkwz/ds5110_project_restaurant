-- order related views, procedures, functions, triggers


-- create one order record
delimiter //
create procedure create_order(in customerID_var int, in numOfDish_var int, in subtotal_var decimal(6,2))
begin
declare currentDate_var date;
declare currentTime_var time;
declare businessDay_var varchar(64);
declare openTime_var time;
declare closeTime_var time;
set currentDate_var = current_date();
set currentTime_var = current_time();
set businessDay_var = convert_date(currentDate_var);
select openTime, closeTime into openTime_var, closeTime_var from business_hour where businessDay = businessDay_var and dayStatus = true;
if openTime_var < currentTime_var and currentTime_var < closeTime_var then
	insert into orders (orderDate, orderTime, orderStatus, orderInQueue, numOfDish, subtotal, tips, total, customerID)
	values
	(currentDate_var, currentTime_var, "Received", false, numOfDish_var, subtotal_var, 0, subtotal_var, customerID_var);
	select max(orderID) from orders;
else
	select 'error' as message;
end if;
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

-- assign a table to one order
delimiter //
create procedure assign_table (in orderID_var int, in tableID_var int)
begin
update orders set tableID = tableID_var where orderID = orderID_var;
select 'Saved.' as message;
end//
delimiter ;

-- check order in queue status
delimiter //
create function check_order_in_queue (orderID_var int)
returns boolean
not deterministic
reads sql data
begin
declare queueStatus boolean;
select orderInQueue into queueStatus from orders where orderID = orderID_var;
return queueStatus;
end//
delimiter ;

-- update orders status
delimiter //
create procedure update_order_status (in orderID_var int, in status_var varchar(64))
begin
if status_var = 'Ready' then
	if check_order_in_queue(orderID_var) = true then
		update orders set orderStatus = status_var where orderID = orderID_var;
		select 'Saved.' as message;
    else
		select 'The order is not in the chef queue.' as message;
	end if;
elseif status_var = 'Canceled' then
	if check_order_in_queue(orderID_var) = false then
		update orders set orderStatus = status_var where orderID = orderID_var;
		select 'Saved.' as message;
	else
		select 'The order is already in the queue and cannot be canceled.' as message;
	end if;
end if;
end//
delimiter ;

-- create a function to calcuate total cost of one order
delimiter //
create function calculate_total (orderID_var int)
returns decimal(6,2)
not deterministic
reads sql data
begin
declare new_total decimal(6,2);
select subtotal + tips into new_total from orders where orderID = orderID_var;
return new_total;
end//
delimiter ;

-- add tips to one order
delimiter //
create procedure update_tips (in orderID_var int, in tips_var decimal(6,2))
begin
update orders set tips = tips_var where orderID = orderID_var;
update orders set total = calculate_total(orderID_var) where orderID = orderID_var;
select 'Saved.' as message;
end//
delimiter ;

-- put one order in queue
delimiter //
create procedure create_order_queue (in orderID_var int, in employeeID_var int)
begin
insert into order_queue (orderID, employeeID)
values (orderID_var, employeeID_var);
select 'Saved.' as message;
end//
delimiter ;

-- create a trigger for update orderInQueue
delimiter //
create trigger update_queue_status after insert on order_queue
for each row
begin
update orders set orderInQueue = true where orderID = NEW.orderID;
end//
delimiter ;

-- create a view for the queue table
create view chef_cooking_queue as
select oq.queueID, oq.orderID, convert(o.orderTime, char(8)) as orderTime, oq.employeeID, concat(e.firstName, ' ', e.lastName) as chefName, o.orderStatus
from order_queue as oq
natural join employee as e
natural join orders as o;

-- create the manager to view the cooking queue
delimiter //
create procedure view_queue ()
begin
select * from chef_cooking_queue;
end//
delimiter ;


