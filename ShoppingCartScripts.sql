--ShoppingCart
create database ShoppingCart

create table Users
(
uid int primary key identity(1,1),
uname varchar(100),
upass varchar(100),
ugender varchar(40),
uaddress varchar(100),
uemail varchar(100),
uvalid bit,
name varchar(100),
rolename varchar(10)
)
 
create table Categories
(
cid int primary key identity(1,1),
cname varchar(80),
cimage varchar(300),
cdesc text,
cvalid bit
) 

create table Products
(
pid int primary key identity(1,1),
cid int foreign key(cid) references Categories(cid),
pname varchar(100),
pdesc varchar(100),
pimage varchar(100),
pfeatures varchar(100),
pprice bigint,
pquantity int,
pdatetime datetime,
pvalid bit
)

create table UserPreference
(
upid int primary key identity(1,1),
uid int foreign key(uid) references Users(uid),
pid int foreign key(pid) references Products(pid),
uspdate varchar(50)
)

create table Cart 
(
caid int primary key identity(1,1),
pid int foreign key(pid) references Products(pid),
uid int foreign key(uid) references Users(uid),
pquantity int,
cadate datetime,
checkedOut bit
)

create table CreditDetails
(
cdid int primary key identity(1,1),
cdnumber varchar(40),
caid int foreign key(caid) references Cart(caid),
cdexpirydate varchar(10),
cdamount bigint,
uid int foreign key(uid) references users(uid),
cdDate varchar(100),
caid varchar(100)
)

create table PaymentHistory
(
phid int primary key identity(1,1),
uid int foreign key(uid) references users(uid),
pid int foreign key(pid) references products(pid),
pquantity bigint,
pamount bigint,
phdate datetime,
cdid int foreign key(cdid) references creditdetails(cdid)
)

create table CreditCards
(
ccid int primary key identity(1,1),
ccname varchar(50),
ccnumber varchar(30),
cvvcode varchar(5),
ccexpirydate varchar(10),
)

insert into creditcards values('S Marsh','1111222233334444','123','12/18')
insert into creditcards values('M Shah','1234123412341234','456','10/19')
insert into creditcards values('S Jajju','1234567812345678','789','08/16')
insert into creditcards values('M Sharma','8765432187654321','786','02/18')

--procedures 

USE [ShoppingCart]
GO

/****** Object:  StoredProcedure [dbo].[prcGetRandomProductsForColor]    Script Date: 03/06/2015 23:10:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[prcGetRandomProductsForColor] 
	@pcolor varchar(60), @uid int, @return int output, @pid int output
AS
BEGIN
	IF EXISTS (Select top 1 pid 
				from Products p 
				where pcolor = @pcolor
				and pid not in(select pid from Cart c where uid = @uid and checkedOut = 0)
				order by newid() )
		BEGIN 
			Select top 1 @pid = pid 
			from Products p 
			where pcolor = @pcolor
			and pid not in(select pid from Cart c where uid = @uid and checkedOut = 0)
			order by newid()
			select @return = 1
		END  
	ELSE IF EXISTS(Select top 1 pid 
					from Products p 
					WHERE pid not in(select pid from Cart c where uid = @uid and checkedOut = 0)
					order by newid())
		BEGIN
			Select top 1 @pid = pid 
			from Products p 
			WHERE pid not in(select pid from Cart c where uid = @uid and checkedOut = 0)
			order by newid()
			select @return = 1
		END
	ELSE
		BEGIN 
			select @return = 0
		END
END

GO


USE [ShoppingCart]
GO

/****** Object:  StoredProcedure [dbo].[prcGetRandomProductsWithoutColor]    Script Date: 03/06/2015 23:11:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[prcGetRandomProductsWithoutColor] 
	 @uid int, @return int output, @pid int output
AS
BEGIN
	IF EXISTS(Select top 1 pid 
					from Products p 
					WHERE pid not in(select pid from Cart c where uid = @uid and checkedOut = 0)
					order by newid())
		BEGIN
			Select top 1 @pid = pid 
			from Products p 
			WHERE pid not in(select pid from Cart c where uid = @uid and checkedOut = 0)
			order by newid()
			select @return = 1
		END
	ELSE
		BEGIN 
			select @return = 0
		END
END

GO


