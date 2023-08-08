drop procedure if exists AddBooking;
delimiter \\
create procedure AddBooking(BookingID int, CustomerID int, tableNo int,  BookingDate date)
begin
insert into bookings(BookingID, CustomerID, TableNumber, Date)
Values (BookingID, CustomerID, TableNo, BookingDate);
select 'New Booking Added' AS 'Confirmation';
end \\
delimiter ;
Call AddBooking(9, 3, 4, '2022-12-30')
