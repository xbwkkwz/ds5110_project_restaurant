-- waiting list related views, procedures, functions, triggers


-- customer join the waiting list
delimiter //
create procedure join_waiting_list (in date_var date, in time_var time, in num_of_people_var int, in customerID_var int)
begin
declare windowID_var int;
select windowID into windowID_var from reservation_window where businessDay = convert_date(date_var) and startTime = time_var and windowStatus = true;
if windowID_var is null then
	select 'Error: Please input a valid dining window (max people of 4).' as message;
else
	insert into waiting_list (waitingDate, windowID, customerID, numOfPeople, waitingStatus)
	values (date_var, windowID_var, customerID_var, num_of_people_var, 'Joined');
	select 'Joined.' as message;
end if;
end//
delimiter ;

-- cancel a waiting list record
delimiter //
create procedure cancel_waiting_list (in waitingID_var int)
begin
update waiting_list set waitingStatus = 'Canceled' where waitingID = waitingID_var;
select 'Canceled.' as message;
end//
delimiter ;

-- create a view for the waiting list history
create view waiting_history as
select wl.waitingID, wl.waitingDate, convert(rw.startTime, char(5)) as startTime, wl.customerID, concat(c.firstName, ' ', c.lastName) as customerName, numOfPeople, waitingStatus
from waiting_list as wl
natural join reservation_window as rw
natural join customer as c
order by wl.waitingID ASC;

-- customer view waiting list history
delimiter //
create procedure view_waiting_list (in customerID_var int)
begin
select waitingID, waitingDate, startTime, numOfPeople, waitingStatus
from waiting_history
where customerID = customerID_var;
end//
delimiter ;

-- employee view all waiting list history
delimiter //
create procedure view_all_waiting_list ()
begin
select * from waiting_history;
end//
delimiter ;








