-- Give the CompanyName of those customers with orders over $100000. Include the subtotal plus tax plus freight.

select ss.Name, expensiveorders.TotalSum from Sales.Customer sc
join Sales.Store ss on (sc.StoreID = ss.BusinessEntityID)
join 
(select ssoh.SalesOrderID, sum(ssoh.SubTotal + ssoh.TaxAmt + ssoh.Freight) TotalSum, ssoh.CustomerID from Sales.SalesOrderHeader ssoh
group by ssoh.SalesOrderID, CustomerID
having sum(ssoh.SubTotal + ssoh.TaxAmt + ssoh.Freight) > 100000) expensiveorders on (sc.CustomerID=expensiveorders.CustomerID)