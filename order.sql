-- ds5110 restaurant project
-- order related

-- get the menu info
delimiter //
create procedure view_menu()
begin
select menu_category.categoryName, menu.menuID, menu.dishName, menu.dishDescription, menu.price
from menu 
natural join menu_category
order by menuID ASC;
end//
delimiter ;

-- 










