select*
from Employees


--1--
select firstname  
from Employees
where FirstName like 'm%'


--2--
select firstname,City
from Employees
where city like 'london' and FirstName like 'robert'

select*
from Products
--3--
select Productname, UnitPrice,UnitsInStock,UnitsInStock%UnitPrice as Sheerit
from Products

--4--
--where a between 10 and 30--

--5--
select Productid as ProdId,ProductName as OrodName,UnitPrice as UntPrc
from Products

--6--
select*
from Customers

select CustomerID, Address+' '+City as fulladress 
from Customers

--7--
select*
from Customers
where Country = 'UK'


--8--
select*
from Products
where UnitsInStock=0 and Discontinued=0

--9-a-
select*
from Employees

select firstname
from Employees
where FirstName in ('nancy') and LastName in ('fuller')

--answer: its return None--

--9-b-
select firstname
from Employees
where FirstName='nancy' or LastName='fuller'
--its return the first name of: the first name and the last name--

--10--
select*
from Employees

select firstname+' from' as firstname,country
from Employees

--11--
select firstname+', '+lastname as fullname,homephone
from Employees


