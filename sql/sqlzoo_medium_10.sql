-- How many products in ProductCategory 'Bikes' have been sold to an address in 'London'?
select sum(query.OrderQty) TotalSum from (select ssoh.SalesOrderID SalesOrderID, ssoh.ShipToAddressID, ssod.OrderQty OrderQty, pp.Name from Sales.SalesOrderHeader ssoh
join Sales.SalesOrderDetail ssod on (ssoh.SalesOrderID=ssod.SalesOrderID)
join Production.Product pp on (ssod.ProductID=pp.ProductID)
join Production.ProductSubcategory pps on (pps.ProductSubcategoryID=pp.ProductSubcategoryID)
join Production.ProductCategory ppc on (ppc.ProductCategoryID=pps.ProductSubcategoryID)
join Person.Address pa on (ssoh.ShipToAddressID=pa.AddressID)
where pa.City='London' and ppc.Name='Bikes') query
