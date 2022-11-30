-- reservation related views, procedures, functions, triggers

-- create a function to convert date to weekday 
delimiter //
create function convert_date (date_var date)
returns varchar(64)
no sql
deterministic
begin 
declare weekday_var varchar(64);
declare num int;
set num = DAYOFWEEK(date_var);
if num = 1 then
	set weekday_var = 'Sunday';
elseif num = 2 then
	set weekday_var = 'Monday';
elseif num = 3 then
	set weekday_var = 'Tuesday';
elseif num = 4 then
	set weekday_var = 'Wednesday';
elseif num = 5 then
	set weekday_var = 'Thursday';
elseif num = 6 then
	set weekday_var = 'Friday';
else
	set weekday_var = 'Saturday';
end if;
return weekday_var;
end//
delimiter ;

-- customer reserves a table
delimiter //
create procedure reserve_table (in date_var date, in time_var time, in num_of_people_var int, in customerID_var int)
begin
declare tableID_var int;
declare windowID_var int;
select windowID into windowID_var from reservation_window where businessDay = convert_date(date_var) and startTime = time_var and windowStatus = true;
if windowID_var is null then
	select 'Error: Please input a valid dining window (max people of 4).' as message;
else
	select tableID into tableID_var from dining_table where tableID 
		not in (select tableID from reservation where reservationDate = date_var and windowID = windowID_var and reservationStatus = 'Reserved')
        and capacity >= num_of_people_var and tableStatus = true
        limit 1;
	if tableID_var is null then
		select 'Error: No more available tables.' as message;
	else
		insert into reservation (reservationDate, windowID, tableID, customerID, numOfPeople, reservationStatus)
        values (date_var, windowID_var, tableID_var, customerID_var, num_of_people_var, 'Reserved');
        select 'Reserved.' as message;
    end if;
end if;
end//
delimiter ;

-- cancel one reservation
delimiter //
create procedure cancel_reservation (in date_var date, in time_var time, in tableID_var int)
begin
declare windowID_var int;
select windowID into windowID_var from reservation_window where businessDay = convert_date(date_var) and startTime = time_var;
update reservation set reservationStatus = 'Canceled' where reservationDate = date_var and windowID = windowID_var and tableID = tableID_var;
select 'Canceled.' as message;
end//
delimiter ;

-- create a view for the reservation history
create view reservation_history as
select r.reservationDate, convert(rw.startTime, char(5)) as startTime, r.tableID, r.customerID, concat(c.firstName, ' ', c.lastName) as customerName, r.numOfPeople, r.reservationStatus, convert(r.employeeID, char(2)) as waiterID, concat(e.firstName, ' ', e.lastName) as waiterName
from reservation as r
natural join reservation_window as rw
natural join customer as c
left join employee as e
on r.employeeID = e.employeeID
order by r.reservationDate;

-- customer view reservation
delimiter //
create procedure view_reservation (in customerID_var int)
begin
select rh.reservationDate, rh.startTime, rh.tableID, rh.numOfPeople, rh.reservationStatus
from reservation_history as rh
where customerID = customerID_var
order by rh.reservationDate;
end//
delimiter ;

-- employee view reservation
delimiter //
create procedure view_all_reservations ()
begin
select * from reservation_history;
end//
delimiter ;

-- assign a waiter to a reservation 
delimiter //
create procedure assign_waiter (in date_var date, in time_var time, in tableID_var int, in employeeID_var int)
begin
declare windowID_var int;
select windowID into windowID_var from reservation_window where businessDay = convert_date(date_var) and startTime = time_var;
update reservation set employeeID = employeeID_var where reservationDate = date_var and windowID = windowID_var and tableID = tableID_var;
select 'Saved.' as message;
end//
delimiter ;



