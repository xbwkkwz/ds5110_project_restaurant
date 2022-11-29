-- store related views, procedures, functions, triggers


-- customer view current business hours
delimiter //
create procedure view_business_hour ()
begin
select businessDay, convert(openTime, char(5)) as openTime, convert(CloseTime, char(5)) as closeTime
from business_hour where dayStatus = true;
end//
delimiter ;

-- employee view all business hours
delimiter //
create procedure view_all_business_hours ()
begin
select timeID, businessDay, convert(openTime, char(5)) as openTime, convert(CloseTime, char(5)) as closeTime, dayStatus
from business_hour;
end//
delimiter ;

-- add business hour into the table
delimiter //
create procedure add_business_hour (in businessDay_var varchar(64), in openTime_var time, in closeTime_var time)
begin
insert into business_hour (businessDay, openTime, closeTime, dayStatus)
values (businessDay_var, openTime_var, closeTime_var, false);
select 'Saved.' as message;
end//
delimiter ;

-- create a function to determine business day
delimiter //
create function find_day (timeID_var int)
returns varchar(64)
deterministic
reads sql data
begin
declare day_var varchar(64);
select businessDay into day_var from business_hour where timeID = timeID_var;
return day_var;
end//
delimiter ;

-- update the business hour
delimiter //
create procedure update_business_hour (in timeID_var int, in dayStatus_var boolean)
begin
declare businessDay_var varchar(64);
declare openTime_var time;
declare closeTime_var time;
select businessDay, openTime, closeTime into businessDay_var, openTime_var, closeTime_var from business_hour where timeID = timeID_var;
update business_hour set dayStatus = dayStatus_var where timeID = timeID_var;
if dayStatus_var = true then
	update business_hour set dayStatus = false where timeID != timeID_var and businessDay = find_day(timeID_var);
    -- update the reservation window
    update reservation_window set windowStatus = false where 0 < windowID and businessDay = businessDay_var;
    update reservation_window set windowStatus = true where 0 < windowID and openTime_var <= startTime and startTime <= closeTime_var;
else
	update reservation_window set windowStatus = false where 0 < windowID and businessDay = businessDay_var;
end if; 
select 'Saved.' as message;
end//
delimiter ;

-- view current restaurant table configurations
delimiter //
create procedure view_all_tables ()
begin
select * from dining_table;
end//
delimiter ;

-- add more tables to the restaurant
delimiter //
create procedure add_table (in capacity_var int)
begin
insert into dining_table (capacity, tableStatus)
values (capacity_var, true);
select 'Saved.' as message;
end//
delimiter ;

-- update table status
delimiter //
create procedure update_table (in tableID_var int, in tableStatus_var boolean)
begin
update dining_table set tableStatus = tableStatus_var
where tableID = tableID_var;
select 'Saved.' as message;
end//
delimiter ;







