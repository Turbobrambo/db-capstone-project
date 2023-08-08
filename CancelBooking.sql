drop procedure if exists CancelBooking;
delimiter \\
create procedure CancelBooking(BookingID int)
begin 
delete from bookings where BookingID = BookingID;
select concat('Booking ',bookingID, ' is cancelled') as 'Confirmation';
end \\
delimiter ;
call CancelBooking(9);
