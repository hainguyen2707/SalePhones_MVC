USE [master]
GO
/****** Object:  Database [Trading2022]    Script Date: 7/9/2024 10:25:49 AM ******/
CREATE DATABASE [Trading2022]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trading2022', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.H58KQVO\MSSQL\DATA\Trading2022.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trading2022_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.H58KQVO\MSSQL\DATA\Trading2022_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Trading2022] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trading2022].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trading2022] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trading2022] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trading2022] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trading2022] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trading2022] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trading2022] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Trading2022] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trading2022] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trading2022] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trading2022] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trading2022] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trading2022] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trading2022] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trading2022] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trading2022] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trading2022] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trading2022] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trading2022] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trading2022] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trading2022] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trading2022] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trading2022] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trading2022] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trading2022] SET  MULTI_USER 
GO
ALTER DATABASE [Trading2022] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trading2022] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trading2022] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trading2022] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trading2022] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trading2022] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trading2022] SET QUERY_STORE = ON
GO
ALTER DATABASE [Trading2022] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Trading2022]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 7/9/2024 10:25:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](20) NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/9/2024 10:25:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] NOT NULL,
	[name] [nvarchar](30) NULL,
	[describe] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/9/2024 10:25:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] NOT NULL,
	[name] [varchar](150) NOT NULL,
	[amount] [money] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/9/2024 10:25:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[cid] [int] NOT NULL,
	[totalmoney] [money] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLine]    Script Date: 7/9/2024 10:25:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLine](
	[oid] [int] NOT NULL,
	[pid] [varchar](10) NOT NULL,
	[quantity] [float] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_OrderLine] PRIMARY KEY CLUSTERED 
(
	[oid] ASC,
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 7/9/2024 10:25:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[ID] [varchar](10) NOT NULL,
	[name] [nvarchar](max) NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[releaseDate] [date] NULL,
	[describe] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[cid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([Username], [Password], [role]) VALUES (N'123', N'123', 2)
GO
INSERT [dbo].[Admin] ([Username], [Password], [role]) VALUES (N'456', N'456', 2)
GO
INSERT [dbo].[Admin] ([Username], [Password], [role]) VALUES (N'admin', N'admin', 1)
GO
INSERT [dbo].[Admin] ([Username], [Password], [role]) VALUES (N'duc', N'duc', 0)
GO
INSERT [dbo].[Admin] ([Username], [Password], [role]) VALUES (N'nghia', N'nghia', 1)
GO
INSERT [dbo].[Admin] ([Username], [Password], [role]) VALUES (N'sa', N'123', 1)
GO
INSERT [dbo].[Categories] ([ID], [name], [describe]) VALUES (1, N'iPhone', N'Đẹp tuyệt vời')
GO
INSERT [dbo].[Categories] ([ID], [name], [describe]) VALUES (2, N'Samsung', N'dáng đẹp, nhiều chức năng')
GO
INSERT [dbo].[Categories] ([ID], [name], [describe]) VALUES (3, N'Oppo', N'Hiện đại, chụp ảnh 20GPixel...')
GO
INSERT [dbo].[Categories] ([ID], [name], [describe]) VALUES (4, N'Vsmart', N'Hiện đại, chụp ảnh 10GPixel...')
GO
INSERT [dbo].[Categories] ([ID], [name], [describe]) VALUES (5, N'Xiaomi', N'Trẻ Trung')
GO
INSERT [dbo].[Customer] ([id], [name], [amount]) VALUES (1, N'Mr A', 20000.0000)
GO
INSERT [dbo].[Customer] ([id], [name], [amount]) VALUES (2, N'Mr B', 1000000.0000)
GO
INSERT [dbo].[Customer] ([id], [name], [amount]) VALUES (3, N'Ms C', 800000.0000)
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (10, CAST(N'2024-03-11' AS Date), 1, 33000.0000)
GO
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (27, CAST(N'2024-03-18' AS Date), 1, 95000.0000)
GO
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (28, CAST(N'2024-03-18' AS Date), 1, 200000.0000)
GO
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (29, CAST(N'2024-03-18' AS Date), 1, 100000.0000)
GO
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (1016, CAST(N'2024-03-18' AS Date), 1, 60000.0000)
GO
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (1017, CAST(N'2024-03-18' AS Date), 1, 140000.0000)
GO
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (1018, CAST(N'2024-03-19' AS Date), 1, 76000.0000)
GO
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (1019, CAST(N'2024-03-19' AS Date), 1, 114000.0000)
GO
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (1020, CAST(N'2024-07-08' AS Date), 1, 214000.0000)
GO
INSERT [dbo].[Order] ([id], [date], [cid], [totalmoney]) VALUES (1021, CAST(N'2024-07-08' AS Date), 1, 741000.0000)
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price]) VALUES (10, N'ss1', 1, 20000)
GO
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price]) VALUES (10, N'vsm1', 1, 13000)
GO
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ip1       ', N'iphone 12 series', -4, 19000.0000, CAST(N'2021-10-04' AS Date), N'Chiếc iPhone siêu nhỏ gọn nhưng mang trên mình sức mạnh 
không đối thủ. iPhone 12 mini là sự lựa chọn hoàn hảo cho những ai đang cần một chiếc 
điện thoại có thể làm mọi thứ nhưng lại nằm gọn trong lòng bàn tay và độ tiện dụng đáng 
kinh ngạc.', N'images/ip1.jpg', 1)
GO
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ip2       ', N'iphone 11 series', 40, 16000.0000, CAST(N'2020-10-04' AS Date), N'Chiếc iPhone siêu nhỏ gọn nhưng mang trên mình sức mạnh 
không đối thủ. iPhone 12 mini là sự lựa chọn hoàn hảo cho những ai đang cần một chiếc 
điện thoại có thể làm mọi thứ nhưng lại nằm gọn trong lòng bàn tay và độ tiện dụng đáng 
kinh ngạc.', N'images/ip2.jpg', 1)
GO
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ip3       ', N'iphone X series', 30, 13000.0000, CAST(N'2019-10-04' AS Date), N'Chiếc iPhone siêu nhỏ gọn nhưng mang trên mình sức mạnh 
không đối thủ. iPhone 12 mini là sự lựa chọn hoàn hảo cho những ai đang cần một chiếc 
điện thoại có thể làm mọi thứ nhưng lại nằm gọn trong lòng bàn tay và độ tiện dụng đáng 
kinh ngạc.', N'images/ip3.jpg', 1)
GO
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'opp1      ', N'oppo find x series', 30, 13000.0000, CAST(N'2020-01-04' AS Date), N'OPPO Reno4 - Chiếc điện thoại với cấu hình mạnh mẽ và công 

 
nghệ sạc siêu nhanh sẽ giúp bạn có được hiệu suất cao để trải nghiệm những điều thú vị 
trong cuộc sống, nhất là trên bộ tứ camera đẳng cấp cùng thiết kế từ nhà OPPO mà ai 
cũng phải ngước nhìn. 
 
', N'images/opp1.jpg', 3)
GO
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'opp2      ', N'oppo find x series', 60, 13000.0000, CAST(N'2020-01-04' AS Date), N'OPPO Reno4 - Chiếc điện thoại với cấu hình mạnh mẽ và công 
nghệ sạc siêu nhanh sẽ giúp bạn có được hiệu suất cao để trải nghiệm những điều thú vị 
trong cuộc sống, nhất là trên bộ tứ camera đẳng cấp cùng thiết kế từ nhà OPPO mà ai 
cũng phải ngước nhìn. 
 
', N'images/opp2.jpg', 3)
GO
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'opp3      ', N'oppo find x series', 60, 13000.0000, CAST(N'2020-01-04' AS Date), N'OPPO Reno4 - Chiếc điện thoại với cấu hình mạnh mẽ và công 
nghệ sạc siêu nhanh sẽ giúp bạn có được hiệu suất cao để trải nghiệm những điều thú vị 
trong cuộc sống, nhất là trên bộ tứ camera đẳng cấp cùng thiết kế từ nhà OPPO mà ai 
cũng phải ngước nhìn. 
 
', N'images/opp3.jpg', 3)
GO
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'opp4      ', N'oppo find x series', 60, 13000.0000, CAST(N'2020-01-04' AS Date), N'OPPO Reno4 - Chiếc điện thoại với cấu hình mạnh mẽ và công 
nghệ sạc siêu nhanh sẽ giúp bạn có được hiệu suất cao để trải nghiệm những điều thú vị 
trong cuộc sống, nhất là trên bộ tứ camera đẳng cấp cùng thiết kế từ nhà OPPO mà ai 
cũng phải ngước nhìn. 
 
', N'images/opp4.jpg', 3)
GO
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'opp5      ', N'oppo find x series', 60, 13000.0000, CAST(N'2020-01-04' AS Date), N'OPPO Reno4 - Chiếc điện thoại với cấu hình mạnh mẽ và công 
nghệ sạc siêu nhanh sẽ giúp bạn có được hiệu suất cao để trải nghiệm những điều thú vị 
trong cuộc sống, nhất là trên bộ tứ camera đẳng cấp cùng thiết kế từ nhà OPPO mà ai 
cũng phải ngước nhìn. 
 
', N'images/opp5.jpg', 3)
GO
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ss1       ', N'Galaxy Z series', 11, 20000.0000, CAST(N'2021-01-04' AS Date), N'Samsung Galaxy Note 20 Ultra được chế tác từ những vật liệu 
cao cấp hàng đầu hiện nay, với sự tỉ mỉ và chất lượng gia công thượng thừa, tạo nên 
chiếc điện thoại đẹp hơn những gì bạn có thể tưởng tượng.', N'images/ss1.jpg', 2)
GO
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ss2       ', N'galaxy note series', 55, 18000.0000, CAST(N'2020-10-08' AS Date), N'Samsung Galaxy Note 20 Ultra được chế tác từ những vật liệu
cao cấp hàng đầu hiện nay, với sự tỉ mỉ và chất lượng gia công thượng thừa, tạo nên 
chiếc điện thoại đẹp hơn những gì bạn có thể tưởng tượng.', N'images/ss2.jpg', 2)
GO
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ss3       ', N'galaxy F series', 60, 16000.0000, CAST(N'2019-10-08' AS Date), N'Samsung Galaxy Note 20 Ultra được chế tác từ những vật liệu 
cao cấp hàng đầu hiện nay, với sự tỉ mỉ và chất lượng gia công thượng thừa, tạo nên 
chiếc điện thoại đẹp hơn những gì bạn có thể tưởng tượng.', N'images/ss3.jpg', 2)
GO
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ss4       ', N'galaxy Z fold', 20, 15000.0000, CAST(N'2018-10-08' AS Date), N'Samsung Galaxy Note 20 Ultra được chế tác từ những vật liệu cao cấp hàng 
đầu hiện nay, với sự tỉ mỉ và chất lượng gia công thượng thừa, tạo nên chiếc điện thoại 
đẹp hơn những gì bạn có thể tưởng tượng.', N'images/ss4.jpg', 2)
GO
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ss5       ', N'galaxy Tab 3', 55, 14000.0000, CAST(N'2017-01-04' AS Date), N'Samsung Galaxy Note 20 Ultra được chế tác từ những vật liệu cao cấp hàng 
đầu hiện nay, với sự tỉ mỉ và chất lượng gia công thượng thừa, tạo nên chiếc điện thoại 
đẹp hơn những gì bạn có thể tưởng tượng.', N'images/ss5.jpg', 2)
GO
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ss6       ', N'galaxy note series', 15, 18000.0000, CAST(N'2020-10-08' AS Date), N'Samsung Galaxy Note 20 Ultra du?c ch? tác t? nh?ng v?t li?u 
cao c?p hàng d?u hi?n nay, v?i s? t? m? và ch?t lu?ng gia công thu?ng th?a, t?o nên 
chi?c di?n tho?i d?p hon nh?ng gì b?n có th? tu?ng tu?ng.', N'images/ss2.jpg', 2)
GO
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ss7       ', N'galaxy note series', 20, 18000.0000, CAST(N'2020-10-08' AS Date), N'Samsung Galaxy Note 20 Ultra du?c ch? tác t? nh?ng v?t li?u 
cao c?p hàng d?u hi?n nay, v?i s? t? m? và ch?t lu?ng gia công thu?ng th?a, t?o nên 
chi?c di?n tho?i d?p hon nh?ng gì b?n có th? tu?ng tu?ng.', N'images/ss2.jpg', 2)
GO
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'vsm1      ', N'Vsmart Joy 4 3GB-64GB', 60, 13000.0000, CAST(N'2020-01-04' AS Date), N'smart Live 4 6GB-64GB sở hữu cấu hình cực đỉnh, đưa bạn đến 
trải nghiệm giải trí bất tận với dung lượng pin lớn, màn hình tuyệt đẹp và 4 camera sau 
AI đầy ấn tượng. 
 
', N'images/vsm1.jpg', 4)
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([cid])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_Order] FOREIGN KEY([oid])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Order]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_products] FOREIGN KEY([pid])
REFERENCES [dbo].[products] ([ID])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_products]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[Categories] ([ID])
GO
USE [master]
GO
ALTER DATABASE [Trading2022] SET  READ_WRITE 
GO
