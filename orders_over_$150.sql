select customers.CustomerID, customers.Name, orders.OrderId, orders.TotalCost, menus.Name, menuitems.Course, menuitems.Starter
from customers inner join orders on customers.CustomerID= orders.CustomerID
inner join menus on orders.MenuID = menus.MenuID
inner join menucontent on menus.MenuID = menucontent.MenuID
inner join menuitems on menuitems.MenuItemID = menucontent.MenuItemID
where orders.TotalCost > 500;
