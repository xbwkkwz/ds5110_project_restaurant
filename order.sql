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

-- display dish in the cart
delimiter //
create procedure view_cart(in menuID_var int)
begin
select dishName from menu where menuID = menuID_var;
end//
delimiter ;








