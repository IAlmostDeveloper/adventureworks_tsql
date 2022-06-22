/*
For each order show the SalesOrderID and SubTotal calculated three ways:
A) From the SalesOrderHeader
B) Sum of OrderQty*UnitPrice
C) Sum of OrderQty*ListPrice
*/


select ssoh.SalesOrderID, ssoh.SubTotal SubTotalA, calculatedSubTotal.SubTotal SubTotalB, calculatedSubTotal2.SubTotal 
from Sales.SalesOrderHeader ssoh 
join (select ssod.SalesOrderID, sum(ssod.UnitPrice*ssod.OrderQty) SubTotal from Sales.SalesOrderHeader ssoh
	join Sales.SalesOrderDetail ssod on (ssoh.SalesOrderID=ssod.SalesOrderID)
	group by ssod.SalesOrderID) calculatedSubTotal on (ssoh.SalesOrderID=calculatedSubTotal.SalesOrderID)
join (select ssod.SalesOrderID, sum(pp.ListPrice*ssod.OrderQty) SubTotal from Sales.SalesOrderDetail ssod
	join Production.Product pp on (pp.ProductID=ssod.ProductID)
	group by ssod.SalesOrderID
	) calculatedSubTotal2 on (calculatedSubTotal2.SalesOrderID=ssoh.SalesOrderID)
	
	where ssoh.SubTotal != calculatedSubTotal.SubTotal 
		or ssoh.SubTotal != calculatedSubTotal2.SubTotal
		or calculatedSubTotal.SubTotal != calculatedSubTotal2.SubTotal


