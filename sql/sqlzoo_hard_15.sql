-- Identify the three most important cities. Show the break down of top level product category against city.

-- drop temp tables
IF OBJECT_ID('tempdb.dbo.#popularCategories', 'U') IS NOT NULL 
  DROP TABLE #popularCategories; 

IF OBJECT_ID('tempdb.dbo.#importantCities', 'U') IS NOT NULL 
  DROP TABLE #importantCities; 

-- Сформировать таблицу количества заказов товаров определенной категории из каждого города
select distinct(pa.City), productCategory.Category, Count(*) OrdersCount 
into #popularCategories
from Sales.SalesOrderHeader ssoh
	join Person.Address pa on (ssoh.ShipToAddressID=pa.AddressID)
	join Sales.SalesOrderDetail ssod on (ssod.SalesOrderID=ssoh.SalesOrderID)
	join (select pp.ProductID, ppc.Name Category from Production.Product pp
		left join Production.ProductSubcategory pps on (pp.ProductSubcategoryID=pps.ProductSubcategoryID)
		left join Production.ProductCategory ppc on (pps.ProductCategoryID=ppc.ProductCategoryID)) productCategory on (ssod.ProductID=productCategory.ProductID)
group by pa.City, productCategory.Category
order by count(*) desc, pa.City desc

-- Сформировать таблицу с тремя городами, в которых было сделано больше всего заказов
select top(3) count(orderCities.SalesOrderID) OrdersCount, orderCities.City 
into #importantCities
from Sales.SalesOrderDetail ssod
join (select pa.City, ssoh.SalesOrderID from Sales.SalesOrderHeader ssoh
	join Person.Address pa on (ssoh.ShipToAddressID=pa.AddressID)) orderCities on (ssod.SalesOrderID=orderCities.SalesOrderID)
join (select pp.ProductID, ppc.Name Category from Production.Product pp
	left join Production.ProductSubcategory pps on (pp.ProductSubcategoryID=pps.ProductSubcategoryID)
	left join Production.ProductCategory ppc on (pps.ProductCategoryID=ppc.ProductCategoryID)) productCategory on (ssod.ProductID=productCategory.ProductID)
group by City
order by count(orderCities.SalesOrderID) desc

-- Получить самую популярную категорию в трех самых важных городах
select distinct pc.City, M.Category from #popularCategories pc
join 
(select pc1.City, pc1.Category, rank() over (partition by pc1.City order by pc1.OrdersCount desc) N from #popularCategories pc1) M
on (M.N=1 and M.City=pc.City)
join #importantCities ic on (ic.City=pc.City)

