CREATE VIEW `ordersview` AS
select OrderID, Quantity, TotalCost
from orders
Where Quantity>2;
