use northwind 

--mission_8--

--Ex_1--
select* from customers

begin transaction
create table US_CUSTOMERS
(CustomrID nchar(5) primary key,
CompanyName nvarchar(40) not null,
ContactName nvarchar(30),
ContactTitle nvarchar(30),
Adress nvarchar(60),
City nvarchar (15),
Region nvarchar(15),
PostalCode nvarchar(10),
Country nvarchar(15),
Phone nvarchar(24),
Fax nvarchar (24))

insert into us_customers
select*from customers


select*from us_customers
rollback

begin transaction
select* into US_CUSTOMERS from customers
where country = 'usa'

select* from us_customers

commit

alter table us_customers
add Customer_Type nvarchar(1)

update us_customers 
set Customer_Type= 'w' where region in (
'wa','ca','or')

alter table us_customers 
add Company_Start_Date datetime


alter table us_customers
add constraint ck_dt check(company_start_date<getdate())

alter table us_customers
add constraint pk_cu_cid primary key(customerid) 

update us_customers
set company_start_date = '2020-08-09'

select*from US_CUSTOMERS


alter table US_CUSTOMERS
drop column Fax

alter table us_customers
drop constraint pk_cu_cid

truncate table us_customers

drop table us_customers