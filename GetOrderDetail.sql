prepare GetOrderDetail
from 'select OrderID, Quantity, TotalCost from orders where OrderID=?';

SET @id = 1;
execute GetOrderDetail using @id;