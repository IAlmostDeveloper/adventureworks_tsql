/*
Show how many orders are in the following ranges (in $):

    RANGE      Num Orders      Total Value
    0-  99
  100- 999
 1000-9999
10000-
*/

select '0- 99' range, count(*) TotalCount, sum(SubTotal) TotalSum from Sales.SalesOrderHeader
where SubTotal <= 99
union all
select '100- 999' range, count(*), sum(SubTotal) from Sales.SalesOrderHeader
where SubTotal between 100 and 999
union all
select '1000- 9999' range, count(*), sum(SubTotal) from Sales.SalesOrderHeader
where SubTotal between 1000 and 9999
union all
select '10000- ' range, count(*), sum(SubTotal) from Sales.SalesOrderHeader
where SubTotal > 10000