-- How many items with LineTotal more than $1000 have been sold? 
select count(*) from Purchasing.PurchaseOrderHeader ppoh
join Purchasing.PurchaseOrderDetail ppod on (ppoh.PurchaseOrderID=ppod.PurchaseOrderID)
where ppod.UnitPrice*ppod.OrderQty > 1000;