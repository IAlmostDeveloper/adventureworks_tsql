  --Where did the racing socks go? List the product name and the CompanyName for all Customers who ordered ProductModel 'Racing Socks'.
  select pp.ProductID, pp.Name ProductName, ssod.SalesOrderID, ss.Name StoreName from Production.Product pp 
  join Production.ProductModel ppm on (pp.ProductModelID=ppm.ProductModelID)
  join Sales.SalesOrderDetail ssod on (ssod.ProductID=pp.ProductID)
  join Sales.SalesOrderHeader ssoh on (ssod.SalesOrderID=ssoh.SalesOrderID)
  join Sales.SalesPerson ssp on (ssoh.SalesPersonID=ssp.BusinessEntityID)
  join Sales.Store ss on (ssp.BusinessEntityID=ss.SalesPersonID)
  where ppm.Name = 'Racing socks';