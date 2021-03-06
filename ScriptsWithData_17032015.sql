USE [master]
GO
/****** Object:  Database [ShoppingCart]    Script Date: 03/17/2015 23:37:42 ******/
CREATE DATABASE [ShoppingCart] ON  PRIMARY 
( NAME = N'ShoppingCart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ShoppingCart.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShoppingCart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ShoppingCart_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShoppingCart] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingCart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingCart] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ShoppingCart] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ShoppingCart] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ShoppingCart] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ShoppingCart] SET ARITHABORT OFF
GO
ALTER DATABASE [ShoppingCart] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ShoppingCart] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ShoppingCart] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ShoppingCart] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ShoppingCart] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ShoppingCart] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ShoppingCart] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ShoppingCart] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ShoppingCart] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ShoppingCart] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ShoppingCart] SET  ENABLE_BROKER
GO
ALTER DATABASE [ShoppingCart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ShoppingCart] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ShoppingCart] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ShoppingCart] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ShoppingCart] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ShoppingCart] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ShoppingCart] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ShoppingCart] SET  READ_WRITE
GO
ALTER DATABASE [ShoppingCart] SET RECOVERY FULL
GO
ALTER DATABASE [ShoppingCart] SET  MULTI_USER
GO
ALTER DATABASE [ShoppingCart] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ShoppingCart] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShoppingCart', N'ON'
GO
USE [ShoppingCart]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/17/2015 23:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[uname] [varchar](100) NULL,
	[upass] [varchar](100) NULL,
	[ugender] [varchar](40) NULL,
	[uaddress] [varchar](100) NULL,
	[uemail] [varchar](100) NULL,
	[uvalid] [bit] NULL,
	[name] [varchar](100) NULL,
	[rolename] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([uid], [uname], [upass], [ugender], [uaddress], [uemail], [uvalid], [name], [rolename]) VALUES (1, N'admin', N'admin', NULL, NULL, NULL, NULL, NULL, N'admin')
INSERT [dbo].[Users] ([uid], [uname], [upass], [ugender], [uaddress], [uemail], [uvalid], [name], [rolename]) VALUES (2, N'mitesh', N'mitesh', N'Male', N'Goregaon', N'miteshvora18@gmail.com', 1, N'Mitesh Vora', N'user')
INSERT [dbo].[Users] ([uid], [uname], [upass], [ugender], [uaddress], [uemail], [uvalid], [name], [rolename]) VALUES (3, N'amish', N'amish', N'Male', N'Goregaon', N'amisvora7018@gmail.com', 1, N'System.Web.UI.WebControls.TextBox', N'user')
INSERT [dbo].[Users] ([uid], [uname], [upass], [ugender], [uaddress], [uemail], [uvalid], [name], [rolename]) VALUES (4, N'test', N'test', N'Male', N'test', N'test@test.com', 1, N'System.Web.UI.WebControls.TextBox', N'user')
INSERT [dbo].[Users] ([uid], [uname], [upass], [ugender], [uaddress], [uemail], [uvalid], [name], [rolename]) VALUES (5, N'test2', N'test2', N'Male', N'Goregaon', N'test@test.com', 1, N'System.Web.UI.WebControls.TextBox', N'user')
INSERT [dbo].[Users] ([uid], [uname], [upass], [ugender], [uaddress], [uemail], [uvalid], [name], [rolename]) VALUES (6, N'test4', N'test4', N'Male', N'test4', N'miteshvora18@gmail.com', 1, N'test4', N'user')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[CreditCards]    Script Date: 03/17/2015 23:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CreditCards](
	[ccid] [int] IDENTITY(1,1) NOT NULL,
	[ccname] [varchar](50) NULL,
	[ccnumber] [varchar](30) NULL,
	[cvvcode] [varchar](5) NULL,
	[ccexpirydate] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ccid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CreditCards] ON
INSERT [dbo].[CreditCards] ([ccid], [ccname], [ccnumber], [cvvcode], [ccexpirydate]) VALUES (1, N'S Marsh', N'1111222233334444', N'123', N'12/18')
INSERT [dbo].[CreditCards] ([ccid], [ccname], [ccnumber], [cvvcode], [ccexpirydate]) VALUES (2, N'M Shah', N'1234123412341234', N'456', N'10/19')
INSERT [dbo].[CreditCards] ([ccid], [ccname], [ccnumber], [cvvcode], [ccexpirydate]) VALUES (3, N'S Jajju', N'1234567812345678', N'789', N'08/16')
INSERT [dbo].[CreditCards] ([ccid], [ccname], [ccnumber], [cvvcode], [ccexpirydate]) VALUES (4, N'M Sharma', N'8765432187654321', N'786', N'02/18')
SET IDENTITY_INSERT [dbo].[CreditCards] OFF
/****** Object:  Table [dbo].[Categories]    Script Date: 03/17/2015 23:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [varchar](80) NULL,
	[cimage] [varchar](300) NULL,
	[cdesc] [text] NULL,
	[cvalid] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT [dbo].[Categories] ([cid], [cname], [cimage], [cdesc], [cvalid]) VALUES (1, N'Desktops', NULL, NULL, 1)
INSERT [dbo].[Categories] ([cid], [cname], [cimage], [cdesc], [cvalid]) VALUES (2, N'Laptops', NULL, NULL, 1)
INSERT [dbo].[Categories] ([cid], [cname], [cimage], [cdesc], [cvalid]) VALUES (3, N'MP3 Player', NULL, NULL, 1)
INSERT [dbo].[Categories] ([cid], [cname], [cimage], [cdesc], [cvalid]) VALUES (4, N'Accessories', NULL, NULL, 1)
INSERT [dbo].[Categories] ([cid], [cname], [cimage], [cdesc], [cvalid]) VALUES (5, N'Furniture', NULL, NULL, 1)
INSERT [dbo].[Categories] ([cid], [cname], [cimage], [cdesc], [cvalid]) VALUES (6, N'Beds', NULL, NULL, 1)
INSERT [dbo].[Categories] ([cid], [cname], [cimage], [cdesc], [cvalid]) VALUES (7, N'Watches', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
/****** Object:  Table [dbo].[Products]    Script Date: 03/17/2015 23:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NULL,
	[pname] [varchar](100) NULL,
	[pdesc] [varchar](100) NULL,
	[pimage] [varchar](100) NULL,
	[pfeatures] [varchar](100) NULL,
	[pprice] [bigint] NULL,
	[pquantity] [int] NULL,
	[pdatetime] [datetime] NULL,
	[pvalid] [bit] NULL,
	[pcolor] [varchar](50) NULL,
	[pbrand] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON
INSERT [dbo].[Products] ([pid], [cid], [pname], [pdesc], [pimage], [pfeatures], [pprice], [pquantity], [pdatetime], [pvalid], [pcolor], [pbrand]) VALUES (1, 1, N'Acer Dual Core Desktop', N'Dual Core Desktop 3 GB RAM with best in class features that will mesmerize your PC experience ', N'product-img1.jpg', N'Sleek design with LCD monitor', 25000, 1000, NULL, 1, N'Black', N'Acer')
INSERT [dbo].[Products] ([pid], [cid], [pname], [pdesc], [pimage], [pfeatures], [pprice], [pquantity], [pdatetime], [pvalid], [pcolor], [pbrand]) VALUES (2, 1, N'Dell Dual Core Desktop', N'Dual Core Desktop 4 GB RAM with best in class features that will mesmerize your PC experience ', N'product-img2.jpg', N'Sleek design with LCD monitor', 28000, 998, NULL, 1, N'Black', N'Dell')
INSERT [dbo].[Products] ([pid], [cid], [pname], [pdesc], [pimage], [pfeatures], [pprice], [pquantity], [pdatetime], [pvalid], [pcolor], [pbrand]) VALUES (3, 1, N'Samsung Dual Core Desktop', N'Dual Core Desktop 5 GB RAM with best in class features that will mesmerize your PC experience ', N'product-img3.jpg', N'Sleek design with LCD monitor', 30000, 900, NULL, 1, N'Gray', N'Samsung')
INSERT [dbo].[Products] ([pid], [cid], [pname], [pdesc], [pimage], [pfeatures], [pprice], [pquantity], [pdatetime], [pvalid], [pcolor], [pbrand]) VALUES (4, 2, N'Dell Dual Core Laptop', N'Dual Core Laptop 3 GB RAM with best laptop battery life ', N'product-img4.jpg', N'Free 1 year warranty', 32000, 99, NULL, 1, N'Black', N'Dell')
INSERT [dbo].[Products] ([pid], [cid], [pname], [pdesc], [pimage], [pfeatures], [pprice], [pquantity], [pdatetime], [pvalid], [pcolor], [pbrand]) VALUES (5, 6, N'Durian Bed', N'Durian Bed', N'Durian.jpg', NULL, 50000, 9, NULL, 1, N'Brown', N'Durian')
INSERT [dbo].[Products] ([pid], [cid], [pname], [pdesc], [pimage], [pfeatures], [pprice], [pquantity], [pdatetime], [pvalid], [pcolor], [pbrand]) VALUES (8, 3, N'Sansa MP3 Player', N'Sansa MP3 Player', N'mp3.jpg', NULL, 1500, 60, CAST(0x0000A3CD00000000 AS DateTime), 1, N'Black', N'Sansa')
INSERT [dbo].[Products] ([pid], [cid], [pname], [pdesc], [pimage], [pfeatures], [pprice], [pquantity], [pdatetime], [pvalid], [pcolor], [pbrand]) VALUES (9, 5, N'Patio dining table', N'Patio Dining table with chairs', N'Patio.jpg', NULL, 50000, 14, CAST(0x0000A3CF00000000 AS DateTime), 1, N'Brown', N'Patio')
INSERT [dbo].[Products] ([pid], [cid], [pname], [pdesc], [pimage], [pfeatures], [pprice], [pquantity], [pdatetime], [pvalid], [pcolor], [pbrand]) VALUES (10, 5, N'Paint for Wood', N'Paint for Wood Furniture', N'paint-for-wood-furniture.jpg', NULL, 10000, 99, CAST(0x0000A44D00000000 AS DateTime), 1, N'Brown', N'Pain for Wood')
INSERT [dbo].[Products] ([pid], [cid], [pname], [pdesc], [pimage], [pfeatures], [pprice], [pquantity], [pdatetime], [pvalid], [pcolor], [pbrand]) VALUES (11, 4, N'Bose outdoor speakers', N'Bose outdoor speakers', N'outdoor_speakers.jpg', NULL, 2000, 300, CAST(0x0000A45400000000 AS DateTime), 1, N'Black', N'Bose')
INSERT [dbo].[Products] ([pid], [cid], [pname], [pdesc], [pimage], [pfeatures], [pprice], [pquantity], [pdatetime], [pvalid], [pcolor], [pbrand]) VALUES (12, 7, N'Rado hyper chrome', N'Rado hyper chrome', N'Rado-HyperChrome-3.jpg', NULL, 30000, 30, CAST(0x0000A45D00000000 AS DateTime), 1, N'Black', N'Rado')
INSERT [dbo].[Products] ([pid], [cid], [pname], [pdesc], [pimage], [pfeatures], [pprice], [pquantity], [pdatetime], [pvalid], [pcolor], [pbrand]) VALUES (13, 7, N'Purple titan watch', N'Purple titan watch', N'PURPLE.png', NULL, 10000, 30, CAST(0x0000A45D00000000 AS DateTime), 1, N'Gray', N'Titan')
INSERT [dbo].[Products] ([pid], [cid], [pname], [pdesc], [pimage], [pfeatures], [pprice], [pquantity], [pdatetime], [pvalid], [pcolor], [pbrand]) VALUES (14, 7, N'1918YM12', N'1918YM12', N'1918YM12.jpg', NULL, 5000, 500, CAST(0x0000A45D00000000 AS DateTime), 1, N'Golden', N'Titan')
SET IDENTITY_INSERT [dbo].[Products] OFF
/****** Object:  Table [dbo].[CreditDetails]    Script Date: 03/17/2015 23:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CreditDetails](
	[cdid] [int] IDENTITY(1,1) NOT NULL,
	[cdnumber] [varchar](40) NULL,
	[cdexpirydate] [varchar](10) NULL,
	[cdamount] [bigint] NULL,
	[uid] [int] NULL,
	[cdDate] [varchar](100) NULL,
	[caid] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[cdid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CreditDetails] ON
INSERT [dbo].[CreditDetails] ([cdid], [cdnumber], [cdexpirydate], [cdamount], [uid], [cdDate], [caid]) VALUES (2, N'1111222233334444', N'11/09/2018', 80000, 2, N'25-10-2014 PM 10:24:54', N'3,15')
INSERT [dbo].[CreditDetails] ([cdid], [cdnumber], [cdexpirydate], [cdamount], [uid], [cdDate], [caid]) VALUES (3, N'1111222233334444', N'11/09/2018', 6000, 2, N'26-10-2014 AM 12:12:32', N'20')
INSERT [dbo].[CreditDetails] ([cdid], [cdnumber], [cdexpirydate], [cdamount], [uid], [cdDate], [caid]) VALUES (4, N'1111222233334444', N'11/09/2018', 300000, 2, N'26-10-2014 PM 3:06:33', N'22')
INSERT [dbo].[CreditDetails] ([cdid], [cdnumber], [cdexpirydate], [cdamount], [uid], [cdDate], [caid]) VALUES (5, N'1111222233334444', N'11/09/2018', 88000, 4, N'15/03/2015 7:14:36 PM', N'11,13')
INSERT [dbo].[CreditDetails] ([cdid], [cdnumber], [cdexpirydate], [cdamount], [uid], [cdDate], [caid]) VALUES (6, N'1111222233334444', N'12/18', 60000, 6, N'16/03/2015 10:49:11 PM', N'45,46')
SET IDENTITY_INSERT [dbo].[CreditDetails] OFF
/****** Object:  Table [dbo].[BuyForMePreference]    Script Date: 03/17/2015 23:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BuyForMePreference](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NULL,
	[ubrand] [varchar](50) NULL,
	[ucolor] [varchar](50) NULL,
	[ulowprice] [varchar](50) NULL,
	[uhighprice] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BuyForMePreference] ON
INSERT [dbo].[BuyForMePreference] ([id], [uid], [ubrand], [ucolor], [ulowprice], [uhighprice]) VALUES (1, 2, N'DELL', N'BLACK', N'1500', N'10000')
INSERT [dbo].[BuyForMePreference] ([id], [uid], [ubrand], [ucolor], [ulowprice], [uhighprice]) VALUES (2, 2, N'pain for wood', N'gray', N'1500', N'30000')
INSERT [dbo].[BuyForMePreference] ([id], [uid], [ubrand], [ucolor], [ulowprice], [uhighprice]) VALUES (3, 2, N'bose', N'gray', N'1500', N'30000')
INSERT [dbo].[BuyForMePreference] ([id], [uid], [ubrand], [ucolor], [ulowprice], [uhighprice]) VALUES (4, 4, N'dell', N'brown', N'1500', N'2000')
INSERT [dbo].[BuyForMePreference] ([id], [uid], [ubrand], [ucolor], [ulowprice], [uhighprice]) VALUES (5, 2, N'acer', N'black', N'1500', N'50000')
INSERT [dbo].[BuyForMePreference] ([id], [uid], [ubrand], [ucolor], [ulowprice], [uhighprice]) VALUES (6, 2, N'durian', N'black', N'1500', N'50000')
INSERT [dbo].[BuyForMePreference] ([id], [uid], [ubrand], [ucolor], [ulowprice], [uhighprice]) VALUES (7, 2, N'dell', N'black', N'1500', N'50000')
INSERT [dbo].[BuyForMePreference] ([id], [uid], [ubrand], [ucolor], [ulowprice], [uhighprice]) VALUES (8, 6, N'acer', N'black', N'1500', N'1500')
SET IDENTITY_INSERT [dbo].[BuyForMePreference] OFF
/****** Object:  Table [dbo].[UserPreference]    Script Date: 03/17/2015 23:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserPreference](
	[upid] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NULL,
	[pid] [int] NULL,
	[uspdate] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[upid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UserPreference] ON
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (1, 2, 8, N'23-10-2014 PM 07:47')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (2, 3, 5, N'23-10-2014 PM 11:33')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (3, 4, 3, N'23-10-2014 PM 11:39')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (4, 4, 4, N'23-10-2014 PM 11:39')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (5, 5, 8, N'25-10-2014 PM 01:02')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (6, 2, 3, N'25-10-2014 PM 03:01')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (7, 4, 9, N'25-10-2014 PM 03:23')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (8, 2, 9, N'25-10-2014 PM 03:24')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (9, 4, 5, N'25-10-2014 PM 04:15')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (10, 2, 4, N'25-10-2014 PM 04:27')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (11, 2, 5, N'25-10-2014 PM 05:46')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (12, 2, 2, N'25-10-2014 PM 06:21')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (13, 4, 2, N'25-10-2014 PM 06:23')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (14, 2, 8, N'25-10-2014 PM 06:51')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (15, 2, 3, N'25-10-2014 PM 06:53')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (16, 2, 9, N'25-10-2014 PM 10:37')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (17, 2, 10, N'28/02/2015 8:18 PM')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (18, 2, 5, N'06/03/2015 1:46 PM')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (19, 2, 5, N'06/03/2015 1:47 PM')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (20, 6, 5, N'06/03/2015 1:52 PM')
INSERT [dbo].[UserPreference] ([upid], [uid], [pid], [uspdate]) VALUES (21, 3, 9, N'17/03/2015 11:35 PM')
SET IDENTITY_INSERT [dbo].[UserPreference] OFF
/****** Object:  Table [dbo].[PaymentHistory]    Script Date: 03/17/2015 23:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentHistory](
	[phid] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NULL,
	[pid] [int] NULL,
	[pquantity] [bigint] NULL,
	[pamount] [bigint] NULL,
	[phdate] [datetime] NULL,
	[cdid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[phid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 03/17/2015 23:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[caid] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NULL,
	[uid] [int] NULL,
	[pquantity] [int] NULL,
	[cadate] [datetime] NULL,
	[checkedOut] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[caid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON
INSERT [dbo].[Cart] ([caid], [pid], [uid], [pquantity], [cadate], [checkedOut]) VALUES (3, 9, 2, 1, CAST(0x0000A3CF01201EFC AS DateTime), 1)
INSERT [dbo].[Cart] ([caid], [pid], [uid], [pquantity], [cadate], [checkedOut]) VALUES (11, 2, 4, 2, CAST(0x0000A3CF012F31F8 AS DateTime), 1)
INSERT [dbo].[Cart] ([caid], [pid], [uid], [pquantity], [cadate], [checkedOut]) VALUES (13, 4, 4, 1, CAST(0x0000A3CF013470F0 AS DateTime), 1)
INSERT [dbo].[Cart] ([caid], [pid], [uid], [pquantity], [cadate], [checkedOut]) VALUES (15, 3, 2, 1, CAST(0x0000A3CF01631D60 AS DateTime), 1)
INSERT [dbo].[Cart] ([caid], [pid], [uid], [pquantity], [cadate], [checkedOut]) VALUES (20, 8, 2, 4, CAST(0x0000A3D000036330 AS DateTime), 1)
INSERT [dbo].[Cart] ([caid], [pid], [uid], [pquantity], [cadate], [checkedOut]) VALUES (22, 9, 2, 6, CAST(0x0000A3D000F8EFBC AS DateTime), 1)
INSERT [dbo].[Cart] ([caid], [pid], [uid], [pquantity], [cadate], [checkedOut]) VALUES (32, 8, 2, 1, CAST(0x0000A45300B5845C AS DateTime), 0)
INSERT [dbo].[Cart] ([caid], [pid], [uid], [pquantity], [cadate], [checkedOut]) VALUES (34, 5, 2, 1, CAST(0x0000A45300C914F4 AS DateTime), 0)
INSERT [dbo].[Cart] ([caid], [pid], [uid], [pquantity], [cadate], [checkedOut]) VALUES (35, 10, 2, 1, CAST(0x0000A45300C92304 AS DateTime), 0)
INSERT [dbo].[Cart] ([caid], [pid], [uid], [pquantity], [cadate], [checkedOut]) VALUES (36, 1, 2, 1, CAST(0x0000A45300CB0CDC AS DateTime), 0)
INSERT [dbo].[Cart] ([caid], [pid], [uid], [pquantity], [cadate], [checkedOut]) VALUES (45, 5, 6, 1, CAST(0x0000A45300E7BD00 AS DateTime), 1)
INSERT [dbo].[Cart] ([caid], [pid], [uid], [pquantity], [cadate], [checkedOut]) VALUES (46, 10, 6, 1, CAST(0x0000A4540185EC50 AS DateTime), 1)
INSERT [dbo].[Cart] ([caid], [pid], [uid], [pquantity], [cadate], [checkedOut]) VALUES (47, 1, 2, 1, CAST(0x0000A45500AAE344 AS DateTime), 0)
INSERT [dbo].[Cart] ([caid], [pid], [uid], [pquantity], [cadate], [checkedOut]) VALUES (50, 2, 2, 1, CAST(0x0000A4560179BA70 AS DateTime), 0)
INSERT [dbo].[Cart] ([caid], [pid], [uid], [pquantity], [cadate], [checkedOut]) VALUES (51, 9, 2, 2, CAST(0x0000A45C013048E0 AS DateTime), 0)
INSERT [dbo].[Cart] ([caid], [pid], [uid], [pquantity], [cadate], [checkedOut]) VALUES (52, 11, 4, 1, CAST(0x0000A45E01811F04 AS DateTime), 0)
INSERT [dbo].[Cart] ([caid], [pid], [uid], [pquantity], [cadate], [checkedOut]) VALUES (53, 11, 3, 1, CAST(0x0000A45E0184A0AC AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Cart] OFF
/****** Object:  StoredProcedure [dbo].[prcGetRandomProductsWithoutColor]    Script Date: 03/17/2015 23:37:45 ******/
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
/****** Object:  StoredProcedure [dbo].[prcGetRandomProductsForColor]    Script Date: 03/17/2015 23:37:45 ******/
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
/****** Object:  ForeignKey [FK__Products__cid__7C1A6C5A]    Script Date: 03/17/2015 23:37:43 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[Categories] ([cid])
GO
/****** Object:  ForeignKey [FK__CreditDetai__uid__13F1F5EB]    Script Date: 03/17/2015 23:37:43 ******/
ALTER TABLE [dbo].[CreditDetails]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([uid])
GO
/****** Object:  ForeignKey [FK__BuyForMePre__uid__1D7B6025]    Script Date: 03/17/2015 23:37:43 ******/
ALTER TABLE [dbo].[BuyForMePreference]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([uid])
GO
/****** Object:  ForeignKey [FK__UserPrefere__pid__01D345B0]    Script Date: 03/17/2015 23:37:43 ******/
ALTER TABLE [dbo].[UserPreference]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[Products] ([pid])
GO
/****** Object:  ForeignKey [FK__UserPrefere__uid__00DF2177]    Script Date: 03/17/2015 23:37:43 ******/
ALTER TABLE [dbo].[UserPreference]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([uid])
GO
/****** Object:  ForeignKey [FK__PaymentHis__cdid__12FDD1B2]    Script Date: 03/17/2015 23:37:43 ******/
ALTER TABLE [dbo].[PaymentHistory]  WITH CHECK ADD FOREIGN KEY([cdid])
REFERENCES [dbo].[CreditDetails] ([cdid])
GO
/****** Object:  ForeignKey [FK__PaymentHist__pid__1209AD79]    Script Date: 03/17/2015 23:37:43 ******/
ALTER TABLE [dbo].[PaymentHistory]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[Products] ([pid])
GO
/****** Object:  ForeignKey [FK__PaymentHist__uid__11158940]    Script Date: 03/17/2015 23:37:43 ******/
ALTER TABLE [dbo].[PaymentHistory]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([uid])
GO
/****** Object:  ForeignKey [FK__Cart__pid__0697FACD]    Script Date: 03/17/2015 23:37:43 ******/
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[Products] ([pid])
GO
/****** Object:  ForeignKey [FK__Cart__uid__078C1F06]    Script Date: 03/17/2015 23:37:43 ******/
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([uid])
GO
