--Show the product description for culture 'fr' for product with ProductID 736. 

select pp.ProductID, ppd.Description from Production.Product pp 
join Production.ProductModelProductDescriptionCulture ppmpdc on (ppmpdc.ProductModelID=pp.ProductModelID)
join Production.ProductDescription ppd on (ppmpdc.ProductDescriptionID=ppd.ProductDescriptionID)
where pp.ProductID=736 and ppmpdc.CultureID='fr';
