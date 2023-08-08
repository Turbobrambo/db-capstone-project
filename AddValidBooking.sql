drop procedure if exists AddValidBooking;
delimiter \\
create procedure AddValidBooking(BookingDate date, TableNo int)
begin 
DECLARE `_rollback` BOOL DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
start transaction
select ('Table ', TableNo, ' is already booked')
from bookings
where (Date = BookingDate and TableNumber= TableNo);
insert into bookings(date, TableNumber)
Values(BookingDate, TableNo);
iIF `_rollback` THEN
			SELECT CONCAT("Table ", TableNumber, " is already booked - booking cancelled") AS "Booking status";
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
	end \\
delimiter ;

Call AddValidBooking('2022-12-27', 6)