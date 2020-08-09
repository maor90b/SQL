--Functions--

--count--

select*
from Employees


select COUNT(*) NumoOfEmpleyees
from Employees

select COUNT(region) NumRegion
from Employees

select COUNT(distinct City) NumRCity
from Employees

--sum--
select*
from Products

select SUM(unitprice) as TotalPrice
from Products

select SUM(unitprice) as TotalPrice,SUM(unitsinstock) as TotalInStock,SUM(unitsonorder) as TotalOnOrder
from Products

--AVG(Average)--
select AVG(unitsonorder) as 'Average Units On Order'
from Products

--max--
select MAX(unitsonorder) as 'Max Units On Order'
from Products

select MAX(ProductName) as 'Max Units On Order' --start with the higher letter-
from Products


select min(unitsonorder)as 'Min Units',MAX(unitsonorder) as 'Max Units '
from Products

--ABS(return negative number as positive)--

--CEILING,FLOOR--

select productid,productname,unitprice
from Products
where productid in (5,14,15,18)


select unitprice,CEILING(unitprice) as 'Ceiling',FLOOR(unitprice) as 'Floor'
from Products
where productid in (5,14,15,18)

--Round--

select unitprice,round(unitprice,1) as 'Round'
from products
where productid in (5,14,15,18)


--sign(if num positive return 1. if 0 return 0. else return -1)--
select unitsonorder,sign(unitsonorder) as 'Sign'
from products


select productname,unitsonorder
from Products
where SIGN(unitsonorder) = 1

--Char(return askii value of letter)--
select CHAR(72)
select ASCII('H')


--Upper,Lower--
select firstname,UPPER(firstname) as 'Capital', LOWER(firstname) as 'small'
from Employees

--Replicate--
select firstname, REPLICATE(firstname,2) as 'Double Name'
from Employees

--Space--
select firstname,space(4) + FirstName as SPACESFIRST,FirstName+SPACE(4) AS SPACELAST
from Employees

--len--
select firstname,len(firstname) as 'Char'
from Employees

--Ltrim, Rtrim--
select RTRIM('    SQ L SE rver    ')+'a'
select LTRIM('    SQ L SE rver    ')+'a'

--Replace--
select lastname,
Replace(lastname,'ha','**')as 'Replacement'
from Employees

--SUBSTRING--
select firstname, SUBSTRING(firstname,2,3) as TAT_MACHROZET
from Employees

--Patindex--
select lastname,
PATINDEX ('%O%',lastname) as O_POSITION
from Employees

--Charindex--
select CHARINDEX('l','MichalTal',7)

--GetDate--
select GETDATE()as CurrentDate

--DateAdd--
select birthdate, DATEADD(yy,2,BirthDate) as 'new birthdate'
from Employees

--Datediff(deate1-date2)
select birthdate,hiredate,datediff(yy,birthdate,hiredate)as 'Hired at age'
from Employees

--DatePart--
select DATEPART(yyyy,'2009-07-02')
select datepart(YYYY,birthdate) as Birthdate_year
from Employees

--DateName(literally,(day,year,month))--
select DATENAME(MM,2010/09/25)as 'Datename'



--STR--
select employeeid,STR(employeeid) as EmpString
from Employees


--Cast,Convert--
select CAST(10.6496 as int)as 'INT'

select CONVERT(int,3.14756)

Select GETDATE() as Currentdate,
CAST(Getdate() as char(12)) as String

select hiredate,convert(char,hiredate,1)as NewDate
from Employees

--Suser_Name--

select SUSER_NAME()

--IsNull--
select lastname, ISNULL(region,'Unknown')as region
from Employees

--Top,Order By--
select top(7) * 
from Orders
order by CustomerID desc --high to low--

select top(7) *
from Orders
order by CustomerID asc --low to high--

select top(7) percent *
from Orders
order by CustomerID desc

select EmployeeID,Title,LastName,FirstName
from Employees
order by Title, LastName 

--Group By--
SELECT*
from[Order Details]


select orderid,sum(unitprice)as Total
from[Order Details]
group by orderid



select orderid,sum(unitprice)as Total,
COUNT(OrderId) as NumOfItems
from[Order Details]
group by orderid


--Having--

select orderid,sum(unitprice)as Total
from[Order Details]
group by OrderID
HAVING (sum(unitprice)>60)

select orderid,sum(unitprice)as Total
from[Order Details]
group by orderid 
--HAVING(orderid>102)



select orderid,sum(unitprice)as Total,sum(Quantity) as 'Num Of Items'
from[Order Details]
group by OrderID
HAVING (sum(Quantity)>3)
order by Total desc



select distinct Products.ProductName,Customers.CustomerID
from Products,Customers
where  Customers.CustomerID like('A%') 

--Join--
select*
from Categories


select*
from Products

select C.Categoryname,P.Productname
from Products as P,Categories as C
where C.CategoryID = P.CategoryID
order by c.CategoryName


select*
from Orders

select*
from [Order Details]


select o.orderid, o.customerid, od.productid,
od.quantity,od.unitprice
from Orders as o,[Order Details] as Od
where o.OrderID=od.OrderID
and od.Quantity >100


--inner join--

select p.ProductName, c.CategoryName
from Products P INNER JOIN Categories C
ON P.CategoryID=C.CategoryID
WHERE CategoryName<'D'


select p.ProductName, c.CategoryName
from Products P INNER JOIN Categories C
ON P.CategoryID=C.CategoryID
WHERE CategoryName<'D'
order by CategoryName

select*
from Products

select*
from Categories

--outerjoin--
select c.CompanyName, o.OrderID
from Customers c right join orders o
on c.CustomerID=o.CustomerID


select c.CustomerID, o.OrderID
from customers c left join orders o
on c.CustomerID=o.CustomerID
where o.OrderID is null


select c.CustomerID, o.OrderID
from customers c full join orders o
on c.CustomerID=o.CustomerID
order by OrderID


select c.CustomerID, o.OrderID
from customers c cross join orders o
order by OrderID

select*
from Employees


select e.EmployeeID,e.FirstName ,e.LastName,e.ReportsTo
from Employees e


select e.FirstName EmpName,M.FirstName MngName
from Employees e,Employees m
where e.ReportsTo=m.EmployeeID


select e.FirstName EmpName,M.FirstName MngName
from Employees e left join Employees m
on e.ReportsTo=m.EmployeeID

select c.CompanyName ,o.OrderID
from Customers c join orders o
on c.CustomerID=o.CustomerID
left join Employees e
on o.CustomerID=e.EmployeeID

--Union--
select City,CompanyName,ContactName
from Customers
union 
select City,CompanyName,ContactName
from Suppliers
order by City,CompanyName



select* from Employees

select* from Customers

--subquery--
select companyname
from Customers 
where Region = (select Region from Employees where EmployeeID=4)


select ProductID,ProductName,UnitPrice
from Products
where UnitPrice> (select avg(UnitPrice))

--In/Not In--

select s.CompanyName,p.ProductName,s.City 
from Products p,Suppliers s


--All--
select s.CompanyName, p.ProductName,s.City
from products p, suppliers s
where p.SupplierID = s.SupplierID 
and s.CompanyName <= all(select CompanyName from Suppliers 
where city in ('london','paris','tel aviv'))

--any/some--

select s.CompanyName, p.ProductName,s.City
from products p, suppliers s
where p.SupplierID = s.SupplierID 
and s.CompanyName = any(select CompanyName from Suppliers
where city in ('london','paris','tel aviv'))


--Exists--
select c.CustomerID
from Customers c
where exists (select o.customerid,o.orderid
from orders o
where c.CustomerID = o.CustomerID)

-- View:
go
	Create View vw_Supplier1
	AS 

	SELECT  SupplierID, COUNT(DISTINCT OrderID) AS DISTORDERSCOUNT
	FROM [Order Details] A JOIN Products B
	ON A.ProductID=B.ProductID
	GROUP BY SupplierID
	go

select* from vw_Supplier1 a
where a.DISTORDERSCOUNT= (select max(DISTORDERSCOUNT) from vw_Supplier1)


--insert--	

INSERT INTO Customers (CustomerID,CompanyName, ContactName, Address, City, PostalCode, Country)
VALUES ('Card','Philips','Tom B. Erichsen','Skagen 21','Stavanger','4006','Norway');


select* from Customers
where CustomerId like ('c%')
go

--update--
use NORTHWND
update Employees
set lastname = 'Ben-Simon',Firstname='Adi'
where lastname = 'cohen' and postalcode=97777

select*
from Employees
go

update Products
set UnitPrice= UnitPrice+10
select*
from Products

--Delete--
delete from Employees
where LastName= 'bartov'

delete from Employees
where Title='announcer'

--ddl(data definition language)--

create table orderdetails_1
(orderid int,
productid int,
unitprice money, 
quantity smallint,
discount real)

select*
from orderdetails_1

create table orderdetails_2
(quantity smallint default (1))

select*
from orderdetails_2

create table orderdetails_3
(orderid int identity(1,1),
productid int,
unitprice money,
quantity smallint default(1),
discount real)

create table employees1
(birthdate datetime constraint ck_emolyees_birthdate Check (birthdate<getdate()))

select*
from employees1

create table orderdetails_4
(orderid int not null,
productid int not null,
unitprice money not null default(0),
quantity smallint default(1),
discount real,
check(discount > =0 and discount <=1),
check (quantity > 0),
check(unitprice>=0))

select*
from orderdetails_4

create table products1
(discount real not null
constraint ck_products_discount check(discount>=0 and discount <=1))

select*
from products1

--unique
create table orderdetails_5
(orderid int not null,
productid int unique)

select*
from orderdetails_5

create table orderdetails_7
(orderid int not null,
productid int,
unitprice money not null default(0),
constraint un_ord_pro_id1 unique (productid))


create table orderdeatails_8
(orderid int primary key)

create table orderdetails_9
(orderid int not null , 
productid int not null,
quantity smallint not null default(1),
primary key(orderid,productid))


select*
from orderdetails_9

create table orderdetails_10
(orderid int 
references orders (orderid))

select*
from orderdetails_10


create table orderdetails_11
(orderid int not null , 
productid int not null,
unitprice money not null default(0),
foreign key(orderid) references orders (orderid),
foreign key(productid) references products (productid))


select*
into orders_1996
from Orders
where YEAR(OrderDate) = 1996

select* from orders_1996

--Alter,Drop
Alter table orders_1996
add firedate datetime not null default(getdate())

alter table orders_1996 add 
check(datepart(dw,firedate)!=7)


ALter Table orders_1996
drop constraint DF__orders_19__fired__25518C17



alter table orders_1996
drop column firedate

select* from orders_1996

truncate table orders_1996


drop table orders_1996