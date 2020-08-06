-- TSQL:

--select
--DML : Data manipulation - INSERT, UPDATE, DELETE
--DDL : data definition - CREATE, DROP
--TSQL : transact SQL , proc.lag.

--BATCH (set of commands)
DECLARE @i INT = 5
SELECT @i as MyVar;
PRINT(@I)

-- int = int , bigint
-- float = float , real , money , double, DECIMAL
-- str = varchar(), nvarchar() , char()
-- bool = Bit (0/1)

DECLARE @i INT = 5 , @name varchar(10) ='Onn M';
SELECT @i as MyNum , @name as MyName

DECLARE @price Float ;--0.00
GO




--Ex_1--
DECLARE @date date = getdate()
print(concat('THE DATE TODAY IS: ', @date))

--Ex_2--
DECLARE @lastn varchar(20)
set @lastn = (select lastname from Employees where EmployeeID=4)
print (@lastn)

--Ex_3--
DECLARE @name varchar (10)
set @name = (select productname from Products where ProductID=5)

DECLARE @category varchar(10)
set @category = (select c.CategoryName from Categories c,Products p where  c.CategoryID=p.CategoryID and p.ProductID=5)

SELECT @name NAME,@category CATEGORY


--Ex_4--
DECLARE @price9 FLOAT (10)
set @price9 = (select unitprice from Products where ProductID=9)
print @price9

if @price9>50
	begin
	print'I LIKE THIS PRODUCT'
	END
ELSE
	BEGIN
	SELECT 'I DO NOT LIKE THIS PRODUCT'
	END
GO

DECLARE @price17 FLOAT(10)
set @price17 = (select unitprice from Products where ProductID=17)
print @price17

if @price17>50
	begin
	print'I LIKE THIS PRODUCT'
	END
ELSE
	BEGIN
	SELECT 'I DO NOT LIKE THIS PRODUCT'
	END
GO

--eX_5--

SELECT PRODUCTID, UNITPRICE, 
NEWPRICE =  CAST(
CASE WHEN UnitPrice<=20 THEN UnitPrice*(1+0.1) 
			WHEN UnitPrice<=50 THEN UnitPrice + 5
			ELSE UnitPrice* (1-0.05)
			END
			AS decimal(10,2))
FROM Products






