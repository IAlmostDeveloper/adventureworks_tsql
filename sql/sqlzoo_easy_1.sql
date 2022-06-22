--Show the first name and the email address of customer with CompanyName 'Bike World'
select top(1) pp.FirstName, pea.EmailAddress, ss.Name StoreName from Sales.Customer sc
  join Sales.Store ss on (ss.BusinessEntityID=sc.StoreID)
  join Person.Person pp on (pp.BusinessEntityID=sc.CustomerID)
  join Person.EmailAddress pea on (pp.BusinessEntityID=pea.EmailAddressID)
  where ss.Name='Bike World'