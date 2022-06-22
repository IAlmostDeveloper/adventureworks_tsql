-- Use the SubTotal value in SaleOrderHeader to list orders from the largest to the smallest. For each order show the CompanyName and the SubTotal and the total weight of the order.
select ss.Name, ssoh.SubTotal from Sales.Store ss
join Sales.Customer sc on (sc.StoreID=ss.BusinessEntityID)
join  (select * from Sales.SalesOrderHeader ) ssoh on (ssoh.CustomerID=sc.CustomerID)
order by ssoh.SubTotal desc;
