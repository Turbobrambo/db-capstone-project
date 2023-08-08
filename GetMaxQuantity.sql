create procedure GetMaxQuantity()
select max(Quantity)
from orders;
CALL GetMaxQuantity;
