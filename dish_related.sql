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



























