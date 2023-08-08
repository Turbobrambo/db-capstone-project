drop procedure if exists CheckBooking;
create procedure CheckBooking(BookingDate date, TableNo int)
select concat('Table ', TableNo, ' is already booked') as 'Booking Status'
where exists 
(select * from bookings where BookingDate=Date and TableNumber = TableNo);

call CheckBooking('2022-11-12', 3)