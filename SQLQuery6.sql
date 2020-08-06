--Ex_8--

select*
from[Order Details]


select Convert(int,unitprice) as 'INT UnitPrice'
from[Order Details]


--Ex_9--

select employeeid,SQRT(employeeid)as 'SQRT'
from Employees

--Ex_10--

select*
from Orders

select orderdate,shippeddate,DATEDIFF(dd,orderdate,shippeddate) as Duration
from Orders

--Ex_11--

select cast('2009-07-27'as datetime)
select CONVERT(datetime,'2009-07-27')

--Ex_12--
 select*
 from Employees

select LOWER(firstname)as UpperFirstName,upper(lastname) as LowerLastName
from Employees
where EmployeeID between 3 and 5


--Ex_13--
select*
from Categories

select CategoryName,Description,CHARINDEX('i',Description,4)as CharIndex
from Categories

--Ex_14--
select*
from Products

select ProductID,ProductName,REPLACE(ProductName,'e','-')as NewProductName
From Products

--Ex_15--
select min(ProductName)as MinName,MAX(productname)as MaxName
from Products

--Ex_16--
select COUNT(*)as CountEmployees
from Employees

--Ex_17--
select count(region)as Region
from Employees

--Ex-18--


select AVG(unitprice)as AverageUnitPrice
from Products

--Ex_19--
select distinct CustomerID
from Orders

--Ex_20--
select top(10)*
from Customers

--Ex_21--
select top(10)percent*
from Customers