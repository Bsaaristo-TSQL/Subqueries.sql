--13 #1 subquery
use MyGuitarShop
  SELECT customerid, SUM(taxamount)
FROM orders
GROUP BY CustomerID
HAVING SUM(TaxAmount) >= 110

--13 #1 Full query

select CustomerID, EmailAddress, FirstName, LastName, '#1: Customers who have paid more than $110
in Taxes' as queryInfo
from Customers
where CustomerID in(
  SELECT customerid
FROM orders
GROUP BY CustomerID
HAVING SUM(TaxAmount) >= 110
)
order by EmailAddress asc

--13 #2 Sub query

 select customerid, shipdate
 from orders
 where shipdate is null
 group by customerid, Shipdate

 --13 #2 full query

 select CustomerID, EmailAddress, FirstName, LastName, '#2: Customers whose orders have Not Shipped' as
queryInfo
from Customers
where CustomerID in(
 select customerid
 from orders
 where shipdate is null
 group by customerid, Shipdate
)
 
 --13 #3 sub query

 select o.orderid, count(oi.orderid) 
 from OrderItems as oi
 join orders as o on oi.OrderID = o.OrderID
 group by o.orderid
 having count(oi.orderid) > 1

 --13 #3 full query

 select CustomerID, EmailAddress, FirstName, LastName, '#3: Customers who have ordered than 1 product' as
queryInfo
from Customers
where CustomerID in(
 select o.orderid
 from OrderItems as oi
 join orders as o on oi.OrderID = o.OrderID
 group by o.orderid
 having count(oi.orderid) > 1
)

--13 #4 sub query

select c.CategoryID
from Categories as c
join products as p on c.CategoryID = p.CategoryID
join OrderItems as oi on p.ProductID = oi.ProductID
join Orders as o on oi.OrderID = o.OrderID

 --13 #4 full query

 select CategoryID, CategoryName, '#4: Categories without orders ' as queryInfo
 from Categories
 where categoryid NOT IN(
 select c.CategoryID
from Categories as c
join products as p on c.CategoryID = p.CategoryID
join OrderItems as oi on p.ProductID = oi.ProductID
join Orders as o on oi.OrderID = o.OrderID
 )
 group by CategoryID, CategoryName
 --or simply where categoryid NOT IN(1,2,3) after looking at the orders.
 
 select * from Customers
 select * from Orders
 select * from OrderItems
 select * from Products
 select * from Categories