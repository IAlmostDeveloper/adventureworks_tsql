-- Show the first 10 best selling items by value. 

select pp.Name, bestSellingItems.ProductID, bestSellingItems.TotalSold from Production.Product pp
join (select top(10) ssod.ProductID, sum(ssod.OrderQty) TotalSold from Sales.SalesOrderDetail ssod
	group by ssod.ProductID
	order by TotalSold desc) bestSellingItems on (pp.ProductID=bestSellingItems.ProductID);
