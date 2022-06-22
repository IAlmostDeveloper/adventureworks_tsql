-- Find the number of left racing socks ('Racing Socks, L') ordered by CompanyName 'Riding Cycles'
  select pp.Name, sum(ssod.OrderQty) TotalQuantity from Production.Product pp 
  join Sales.SalesOrderDetail ssod on (ssod.ProductID=pp.ProductID)
  where pp.Name='Racing Socks, L'
  group by pp.Name