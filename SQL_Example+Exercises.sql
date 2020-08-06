--DISTINCT מאפשר לראות את הרשומות בעמודה הנבחרת רק פעם אחת
SELECT distinct country
from Employees




--SELECT*
SELECT FirstName,LastName
FROM Employees
where FirstName = 'Nancy' or FirstName= 'janet'
--this is a remark

--select*               אם יש רווח בכותרת הטבלה להוסיף סוגריים מרובעים
--from [Order Details]




select*
from Employees
where EmployeeID= '3'


select*
from Products



select firstname +' '+lastname  as [Full Name]
from Employees


select productname,unitprice,unitprice*1.18 as Maam
from Products


select*
from Employees
where Region is null


select*
from Products
where ProductName<='D'




SELECT*
FROM Employees
WHERE FirstName LIKE '_A%'  --מראה כל שם שהאות השניה היא A והאותיות שאחרי זה כל האותיות



SELECT*
FROM Employees
where Title = 'Sales Representative' and TitleOfCourtesy = 'Mr.'


SELECT*
FROM Employees
where Title = 'Sales Representative' or TitleOfCourtesy = 'Mr.'


SELECT LastName
FROM Employees
where LastName not like 'D%'  --שלא מתחיל בD


--SELECT COSTUMERID,COMPANYNAME,PHONE,FAX
--FROM Employees
--WHERE FAX IS NOT NULL



SELECT FirstName,EmployeeID
FROM Employees
WHERE EmployeeID in (1,6,8)




SELECT FirstName, LastName
FROM Employees
where lastname in ('fuller','king')



SELECT FirstName, Extension
FROM Employees
where Extension between 3000 and 4000




select firstname       --תרגיל 2.1
from Employees
where firstname like 'M%'




