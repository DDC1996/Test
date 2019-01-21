use Company

CREATE TABLE Company (
    Customer_ID int PRIMARY KEY IDENTITY(1,1),
    FirstName varchar(255),
    LastName varchar(255),
    City varchar(255),
	Country varchar(255),
	MobileNo numeric(10,0)
);

INSERT into Company(FirstName,LastName,City,Country,MobileNo) values ('Dhruv','Desai','Visnagar','India',9408825655)
INSERT into Company values ('Vivek','Dhakan','Afghan','Qabul',9409825655)
INSERT into Company values ('Het','Parekh','Jetpur','India',9409835655)
INSERT into Company values ('Anant','Patel','Anand','India',9449835655)

CREATE TABLE Supplier (
    Supplier_ID int PRIMARY KEY IDENTITY(1,1),
    CompanyName varchar(255),
    LastName varchar(255),
	ContactName varchar (255),
    City varchar(255),
	Country varchar(255),
	MobileNo numeric(10,0)
);

INSERT into Supplier values ('DDC','Desai','Jitubhai','Dhakan','Qabul',9409825655)
INSERT into Supplier values ('CCD','Patel','Dhruv','Gandhinagar','India',9909825655)
INSERT into Supplier values ('Freny','Desai','Vivek','Ahmedabad','India',9609825655)


CREATE TABLE Product (
    Product_ID int PRIMARY KEY IDENTITY(1,1),
    ProductName varchar(255),
	Supplier_ID int Foreign KEY REFERENCES Supplier(Supplier_ID),
    UnitPrice decimal(18,3),
);

INSERT into Product values ('Biscuit',1,1000)
INSERT into Product values ('Comb',2,2000)
INSERT into Product values ('Milk',3,3000)

CREATE TABLE Order_Tbl (
    Order_ID int PRIMARY KEY IDENTITY(1,1),
    Order_Date timestamp ,
    Order_No bigint ,
	Customer_ID int FOREIGN KEY REFERENCES Company(Customer_ID),
    TotalAmount bigint ,
);

INSERT into Order_Tbl (Order_No,Customer_ID,TotalAmount) values ('111',1,100000)
INSERT into Order_Tbl (Order_No,Customer_ID,TotalAmount) values ('222',2,200000)
INSERT into Order_Tbl (Order_No,Customer_ID,TotalAmount) values ('333',3,300000)

CREATE TABLE Order_Item (
Order_Item_ID int PRIMARY KEY IDENTITY (1,1),
Order_ID int FOREIGN KEY REFERENCES Order_Tbl(Order_ID),
Product_ID int FOREIGN KEY REFERENCES Product(Product_ID),
UnitPrice decimal(18,3),
Quantity int 
);

INSERT into Order_Item (Order_ID,Product_ID,UnitPrice,Quantity) values (1,1,500.566,5)
INSERT into Order_Item (Order_ID,Product_ID,UnitPrice,Quantity) values (2,3,600,5)
INSERT into Order_Item (Order_ID,Product_ID,UnitPrice,Quantity) values (2,3,700,5)



select * from Company
select * from Supplier
select * from Product
select * from Order_Tbl
select * from Order_Item

// LEFT JOIN 
select * from Company LEFT JOIN Order_Tbl on Company.Customer_ID=Order_Tbl.Customer_ID;

//RIGHT JOIN 
select * from Company Right JOIN Order_Tbl on Company.Customer_ID=Order_Tbl.Customer_ID;

//INNER JOIN 
select * from Company INNER JOIN Order_Tbl on Company.Customer_ID=Order_Tbl.Customer_ID;

// FULL OUTER JOIN
select * from Company FULL OUTER JOIN Order_Tbl on Company.Customer_ID=Order_Tbl.Customer_ID;

//CROSS JOIN 
select * from Company CROSS JOIN Order_Tbl

//EQUI JOIN
select * from Company , Order_Tbl where Company.Customer_ID=Order_Tbl.Customer_ID



CREATE Function count_createe()

returns int 
as 
begin

   declare @total int
   select @total = COUNT(*)
   from Company
   where City = 'Jetpur'
   return @total
end  

select dbo.count_createe()


CREATE Function inline()

returns table 
as
RETURN 

( select FirstName,LastName,City,Country,MobileNo from Company );

select * from dbo.inline();