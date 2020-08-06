--Mission_4--

--Ex_5--
select ProductName,ProductID
from Products
order by productname desc

--Ex_6--
select categoryid,sum(unitprice) as SumUnitPrice
from Products
group by CategoryID


--Ex_7--
select CategoryID,MAX(unitprice) MaxUnitPrice,MIN(unitprice) MinUnitPrice
from Products
group by CategoryID

--Ex_8--
select companyname,City
from Customers
where City like 'London' or City like 'ma%'
order by CompanyName asc

--Ex_9--
select companyname ,Region
from Customers
where Region is not null

--Ex_10--
select SupplierID,sum(unitprice) as SumUnitPrice,sum(UnitsInStock)as UnitsInStock,CategoryID
from Products
group by SupplierID,CategoryID
having sum(unitprice)>50 and CategoryID>2
order by sum(UnitsInStock) desc

--Ex_11--
select top(10)percent*
from Customers
order by customerid desc


--Mission_5--

--Ex_5--
select P.productname,C.Categoryname
from Products as P,Categories as C
where p.CategoryID=c.CategoryID

--Ex_6--
select P.productname,C.Categoryname,p.UnitPrice
from Products as P,Categories as C
where p.CategoryID=c.CategoryID and UnitPrice>50

--Ex_7--
select E.FirstName,e.LastName,ET.TerritoryID,T.TerritoryDescription
from Employees as E,EmployeeTerritories as ET, Territories T
where ET.TerritoryID= T.TerritoryID and e.EmployeeID=et.EmployeeID

select*
from EmployeeTerritories
select*
from Territories

--Ex_8--
select*
from Orders

select*
from Customers

select c.CustomerID,o.CustomerID,o.OrderID,o.OrderDate,c.ContactName,c.City,c.Phone
from Customers c left join Orders o
on c.CustomerID=o.CustomerID
where o.OrderID>10700 
order by c.CustomerID desc


--Ex_9--
select*
from [Order Details]

select* 
from Orders

select c.CustomerID,od.UnitPrice,od.UnitPrice+5 as NewUnitPrice,o.orderid,c.City
from orders o,Customers c,[Order Details] OD  
where c.CustomerID=o.CustomerID and o.OrderID=od.OrderID and c.City='london'

--Ex_10--
select p.ProductID,p.UnitPrice,p.SupplierID,p.CategoryID,c.CategoryName
from Products P inner join Categories C 
on p.CategoryID=c.CategoryID
where c.CategoryName like '%a%'

--Ex_11--
select*
from Suppliers

select p.ProductName, c.Description,S.City
from Suppliers s, Categories c, products P
where c.CategoryID=p.CategoryID and p.CategoryID=c.CategoryID and s.SupplierID=p.SupplierID and
s.City in ('london','tokyo')

--Ex_12--
select c.CompanyName,o.OrderID 
from customers C left join orders o 
on c.CustomerID=o.CustomerID

--Ex_13--
select e.FirstName,e.LastName,M.FirstName,m.LastName
from employees E left join Employees M
on m.EmployeeID= e.ReportsTo
order by e.EmployeeID

--Ex_14--
select p.ProductName,p.UnitPrice,p.SupplierID,s.ContactName
from Suppliers S join Products P
on s.SupplierID=p.SupplierID


--Mission_6--
 
 --Ex_3--
 select ProductName
 from Products
 where UnitPrice <(select UnitPrice from Products where ProductID=4)

 --Ex_4--
 select ProductName,UnitPrice
 from Products 
 where UnitPrice>(select unitprice from Products where ProductName='chai')

 --Ex_5--
 select FirstName,HireDate
 from Employees
 where hiredate in (select hiredate from Employees where EmployeeID>6)

 --Ex_6--
 select ProductID,ProductName,UnitPrice
 from Products 
 where UnitPrice > (select avg(UnitPrice) from Products)

 --Ex_7--
 select unitsinstock
 from Products
 where UnitsInStock< (select avg(unitsinstock) from Products)

 --Ex_8--
 select ProductName,UnitPrice
 from Products
 where unitprice= any(select UnitPrice from Products where CategoryID=7) 

 --Ex_9--
 select ProductName,UnitPrice
 from Products
 where unitprice not in (select unitprice from Products where CategoryID=7)

 --Ex_10--
 select ProductName,UnitPrice
 from Products
 where UnitPrice> any(select UnitPrice from Products where CategoryID=7) 

 --Ex_11--
select ProductName,UnitPrice
 from Products
 where UnitPrice< any(select UnitPrice from Products where CategoryID=7) 


 --Ex_12--
 select ProductName,UnitPrice
 from Products
 where UnitPrice>all (select UnitPrice from Products where CategoryID=7) 

 --Ex_13--
 select ProductName,UnitPrice
 from Products
 where UnitPrice<all(select UnitPrice from Products where CategoryID=7) 

--Ex_14--
select SupplierID
from Products
where UnitPrice >=all(select UnitPrice from Products)

select*from Products
select*from orders
select*from[Order Details]
--Ex_15--
SELECT  SUPPLIERID, COUNT(OrderID) AS ORDERCOUNT
FROM [Order Details] A 
JOIN Products B
ON A.ProductID=B.ProductID
GROUP BY SupplierID

SELECT SUPPLIERID,COUNT(*) CROWCOUNT,COUNT(DISTINCT OrderID) DISORDECOUNT,COUNT(DISTINCT A.PRODUCTID),ORDERID,A.PRODUCTID FROM [Order Details] A
JOIN Products B ON A.ProductID=B.ProductID
WHERE SupplierID=15
ORDER BY OrderID


--ANSWER 15--
SELECT TOP 1 SupplierID, COUNT(DISTINCT OrderID) AS DISTORDERSCOUNT
FROM [Order Details] A JOIN Products B
ON A.ProductID=B.ProductID
GROUP BY SupplierID ORDER BY DISTORDERSCOUNT DESC
--Ex_16--

select Productid,ProductName,UnitPrice from Products
where UnitPrice > (select UnitPrice from Products where ProductName='alice mutton')

--Ex_17--
select *
from Employees
select*
from Products
select* from[Order Details]
select* from Orders

select COUNT(orderid)
from Orders
where EmployeeID in (select EmployeeID from Employees where BirthDate=
(select MIN(BirthDate)from Employees))



--Ex_18--
select*
from Customers

select avg(unitprice)
from [Order Details],Customers
where Region in (select region from Customers where Region in ('wa'))