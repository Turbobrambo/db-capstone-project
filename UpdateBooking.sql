drop procedure if exists UpdateBooking;
delimiter \\
create procedure UpdateBooking(BookingID int, BookingDate date)
begin
update bookings set Date = BookingDate where BookingID = BookingID;
select concat('Booking ', BookingID, ' is updated') as 'Confirmation';
end \\
delimiter ;
call UpdateBooking(9, '2022-12-17');