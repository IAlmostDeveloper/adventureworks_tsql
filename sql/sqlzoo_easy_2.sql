-- Show the CompanyName for all customers with an address in City 'Dallas'.
select ss.Name from Sales.Customer sc
join Sales.Store ss on (sc.StoreID=ss.BusinessEntityID)
join Person.Person pp on (sc.CustomerID=pp.BusinessEntityID)
join Person.Address pa on (pa.AddressID=pp.BusinessEntityID)
where pa.City='Dallas';