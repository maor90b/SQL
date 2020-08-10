--Views Exercises--

--Ex_5--
create view CurrentProducs_view 
as
select ProductID,ProductName 
from Products
where Discontinued=0
go
select*from CurrentProducs_view
go
--Ex_6--
create view HighPrice_view
as
select ProductName,UnitPrice 
from Products
where unitprice>(select AVG(unitprice) 
from Products)
go
select*from [Product Sales for 1997]
go
--Ex_7--
create view TotalSales97_view
as
select CategoryName,sum(ProductSales) CategorySales 
from [Product Sales for 1997]
group by CategoryName
go

select CategoryName,CategorySales 
from TotalSales97_view
where CategoryName='beverages'

drop view CurrentProducs_view
go
CREATE VIEW CurrentProducs_view
as
select ProductID,ProductName,CategoryID 
from Products
where Discontinued=0
go

select* from CurrentProducs_view

select*
from CurrentProducs_view
where CategoryID in (2,4,8)

select CategoryID,count(  ProductID) countP
from CurrentProducs_view
where CategoryID in (2,4,8)
group by CategoryID