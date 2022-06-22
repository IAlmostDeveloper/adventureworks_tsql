-- A "Single Item Order" is a customer order where only one item is ordered. Show the SalesOrderID and the UnitPrice for every Single Item Order.
  select singleitemorders.SalesOrderID, UnitPrice from Sales.SalesOrderDetail
  join (select SalesOrderID from Sales.SalesOrderDetail 
  group by SalesOrderID
  having count(*) = 1) singleitemorders on (Sales.SalesOrderDetail.SalesOrderID=singleitemorders.SalesOrderID)